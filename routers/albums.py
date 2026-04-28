from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from schemas import ReviewRequest, MoodRequest

MOOD_MAPPING = {
    "Happy": ["Pop", "Dance", "Electronic"],
    "Chill": ["R&B", "Indie Alternative", "Acoustic", "Lo-Fi"],
    "Energetic": ["Pop", "Hip Hop & Rap", "Dance", "Metal"],
    "Late Night": ["Synthwave", "R&B", "Lo-Fi"],
    "Nostalgic": ["Pop", "Rock", "Classic Pop"],
    "Angry": ["Metal", "Hip Hop & Rap", "Punk"],
    "Focus": ["Classical", "Ambient", "Electronic", "Jazz"],
    "Workout": ["Hip Hop & Rap", "Dance", "Metal", "Electronic"],
    "Sad": ["Acoustic", "Indie Alternative", "R&B"]
    # You can expand this mapping list based on your 30 moods
}

router = APIRouter(prefix="/api", tags=["albums"])



@router.get("/albums/trending")
def get_trending(db: Session = Depends(get_db)):
    try:
        # Trending Algorithm:
        # 1. Direct Album Reviews (High Weight: 10 points)
        # 2. Scene Threads (Medium Weight: 3 points)
        # 3. Scene Replies (Low Weight: 1 point)
        # Filters for activity within the last 30 days to keep it fresh.
        
        sql = text("""
            WITH RecentReviews AS (
                SELECT alb_id, COUNT(rv_id) as review_count
                FROM reviews
                WHERE date_created >= NOW() - INTERVAL '30 days'
                GROUP BY alb_id
            ),
            RecentThreads AS (
                SELECT scene_id, COUNT(t_id) as thread_count
                FROM threads
                WHERE date_created >= NOW() - INTERVAL '30 days'
                GROUP BY scene_id
            ),
            RecentReplies AS (
                SELECT t.scene_id, COUNT(r.rep_id) as reply_count
                FROM replies r
                JOIN threads t ON r.thread_id = t.t_id
                WHERE r.date_created >= NOW() - INTERVAL '30 days'
                GROUP BY t.scene_id
            ),
            AlbumScores AS (
                SELECT 
                    a.alb_id,
                    a.name as album_name,
                    a.cover_url,
                    COALESCE(rr.review_count, 0) * 10 AS review_score,
                    COALESCE(rt.thread_count, 0) * 3 AS thread_score,
                    COALESCE(rp.reply_count, 0) * 1 AS reply_score
                FROM albums a
                LEFT JOIN RecentReviews rr ON a.alb_id = rr.alb_id
                LEFT JOIN RecentThreads rt ON a.scene_id = rt.scene_id
                LEFT JOIN RecentReplies rp ON a.scene_id = rp.scene_id
            )
            SELECT 
                a.alb_id, 
                a.album_name, 
                a.cover_url, 
                MAX(ar.name) as artist_name,
                (a.review_score + a.thread_score + a.reply_score) as total_score
            FROM AlbumScores a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            GROUP BY a.alb_id, a.album_name, a.cover_url, a.review_score, a.thread_score, a.reply_score
            ORDER BY total_score DESC, RANDOM()
            LIMIT 10
        """)
        
        results = db.execute(sql).fetchall()
        
        # If your app is brand new and has no recent reviews/threads, 
        # this will gracefully fallback to random albums until activity starts!
        return [
            {
                "id": r.alb_id, 
                "title": r.album_name, 
                "artist": r.artist_name or "Unknown Artist", 
                "coverUrl": r.cover_url
            } 
            for r in results
        ]
        
    except Exception as e:
        print(f"Trending Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))
@router.get("/albums/recommended")
def get_recommended(username: str = None, db: Session = Depends(get_db)):
    try:
        mood_albums = []
        personalized_albums = []
        
        if username:
            user = db.execute(text("SELECT u_id, current_mood FROM users WHERE username = :name"), {"name": username}).fetchone()
            if user:
                uid = user.u_id
                user_mood = getattr(user, 'current_mood', None)
                
                # --- 1. MOOD-BASED FILTERING (Limit 5) ---
                if user_mood:
                    target_genres = tuple(MOOD_MAPPING.get(user_mood, ["__dummy__"]))
                    
                    mood_sql = text("""
                        SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name
                        FROM albums a
                        LEFT JOIN albums_x_genres axg ON a.alb_id = axg.alb_id
                        LEFT JOIN genres g ON axg.gen_id = g.gen_id
                        LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
                        LEFT JOIN artists ar ON axa.art_id = ar.art_id
                        LEFT JOIN user_moods um ON a.alb_id = um.alb_id
                        LEFT JOIN moods m ON um.mood_id = m.mood_id
                        WHERE (
                            g.name IN :target_genres 
                            OR m.name = :user_mood 
                        )
                        AND a.alb_id NOT IN (
                            SELECT mxa.alb_id FROM mixtapes_x_albums mxa 
                            JOIN mixtapes mix ON mxa.mx_id = mix.mix_id WHERE mix.owner_id = :uid
                        )
                        GROUP BY a.alb_id, a.name, a.cover_url
                        ORDER BY RANDOM() LIMIT 5
                    """)
                    
                    mood_results = db.execute(mood_sql, {
                        "uid": uid, 
                        "target_genres": target_genres, 
                        "user_mood": user_mood
                    }).fetchall()
                    
                    mood_albums = [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url, "reason": f"Because you feel {user_mood}"} for r in mood_results]

                # --- 2. STANDARD PERSONALIZED FILTERING (Limit 5) ---
                excluded_ids = tuple([a["id"] for a in mood_albums]) if mood_albums else tuple([-1])

                personalized_sql = text("""
                    SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name
                    FROM albums a
                    LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
                    LEFT JOIN artists ar ON axa.art_id = ar.art_id
                    LEFT JOIN albums_x_genres axg ON a.alb_id = axg.alb_id
                    WHERE (
                        axg.gen_id IN (
                            SELECT axg2.gen_id FROM albums_x_genres axg2
                            JOIN mixtapes_x_albums mxa ON axg2.alb_id = mxa.alb_id
                            JOIN mixtapes mix ON mxa.mx_id = mix.mix_id WHERE mix.owner_id = :uid
                        )
                    )
                    AND a.alb_id NOT IN (
                        SELECT mxa2.alb_id FROM mixtapes_x_albums mxa2
                        JOIN mixtapes mix2 ON mxa2.mx_id = mix2.mix_id WHERE mix2.owner_id = :uid
                    )
                    AND a.alb_id NOT IN :excluded_ids
                    GROUP BY a.alb_id, a.name, a.cover_url
                    ORDER BY RANDOM() LIMIT 5
                """)
                
                personalized_results = db.execute(personalized_sql, {"uid": uid, "excluded_ids": excluded_ids}).fetchall()
                personalized_albums = [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url, "reason": "Made For You"} for r in personalized_results]

        # --- 3. BLEND AND FALLBACK (Ensure exactly 10 albums) ---
        final_recommendations = mood_albums + personalized_albums
        
        if len(final_recommendations) < 10:
            needed = 10 - len(final_recommendations)
            current_ids = tuple([a["id"] for a in final_recommendations]) if final_recommendations else tuple([-1])

            fallback_sql = text("""
                SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name
                FROM albums a
                LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
                LEFT JOIN artists ar ON axa.art_id = ar.art_id
                WHERE a.alb_id NOT IN :current_ids
                GROUP BY a.alb_id, a.name, a.cover_url
                ORDER BY RANDOM() LIMIT :needed
            """)
            fallback_results = db.execute(fallback_sql, {"current_ids": current_ids, "needed": needed}).fetchall()
            
            # CHANGE the "reason" here from "Trending" to "Made For You"
            fallback_albums = [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url, "reason": "Made For You"} for r in fallback_results]
            final_recommendations.extend(fallback_albums)
            
        return final_recommendations

    except Exception as e:
        print(f"Recommendation Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))
    try:
        # 1. If a user is logged in, attempt personalized recommendations
        if username:
            user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": username}).fetchone()
            if user:
                uid = user.u_id
                
                # Content-Based Filtering with GROUP BY to safely use RANDOM()
                personalized_sql = text("""
                    SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name
                    FROM albums a
                    LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
                    LEFT JOIN artists ar ON axa.art_id = ar.art_id
                    LEFT JOIN albums_x_genres axg ON a.alb_id = axg.alb_id
                    WHERE (
                        -- Factor 1: Genres
                        axg.gen_id IN (
                            SELECT axg2.gen_id
                            FROM albums_x_genres axg2
                            JOIN mixtapes_x_albums mxa ON axg2.alb_id = mxa.alb_id
                            JOIN mixtapes m ON mxa.mx_id = m.mix_id
                            WHERE m.owner_id = :uid
                        )
                        OR 
                        -- Factor 2: Artists
                        axa.art_id IN (
                            SELECT axa2.art_id
                            FROM artists_x_albums axa2
                            JOIN mixtapes_x_albums mxa ON axa2.alb_id = mxa.alb_id
                            JOIN mixtapes m ON mxa.mx_id = m.mix_id
                            WHERE m.owner_id = :uid
                        )
                    )
                    AND a.alb_id NOT IN (
                        -- Exclude already saved albums
                        SELECT mxa2.alb_id
                        FROM mixtapes_x_albums mxa2
                        JOIN mixtapes m2 ON mxa2.mx_id = m2.mix_id
                        WHERE m2.owner_id = :uid
                    )
                    GROUP BY a.alb_id, a.name, a.cover_url
                    ORDER BY RANDOM() LIMIT 5
                """)
                
                results = db.execute(personalized_sql, {"uid": uid}).fetchall()
                
                # If personalized results exist, return them
                if results and len(results) > 0:
                    return [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url} for r in results]

        # 2. Fallback (Not logged in, or no list data available)
        # Using GROUP BY here as well to ensure a true shuffle
        fallback_sql = text("""
            SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            GROUP BY a.alb_id, a.name, a.cover_url
            ORDER BY RANDOM() LIMIT 5
        """)
        results = db.execute(fallback_sql).fetchall()
        return [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url} for r in results]
        
    except Exception as e:
        print(f"Recommendation Error: {e}") # This will log the exact issue to your FastAPI terminal
        raise HTTPException(status_code=500, detail=str(e))
    
@router.get("/albums/friends-recommended")
def get_friend_recommendations(username: str, db: Session = Depends(get_db)):
    try:
        # Get the current user's ID
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            return [] # Return empty if user not found
            
        uid = user.u_id

        # Algorithm: Gather albums from friends' mixtapes and reviews, 
        # grouping by album to rank by popularity among friends,
        # and excluding albums the user already has in their mixtapes.
        friend_sql = text("""
            WITH UserFriends AS (
                -- Get everyone the current user follows
                SELECT following_id as friend_id
                FROM followings
                WHERE u_id = :uid
            ),
            FriendInteractions AS (
                -- Signal 1: Albums friends put in mixtapes
                SELECT mxa.alb_id, m.owner_id as friend_id
                FROM mixtapes_x_albums mxa
                JOIN mixtapes m ON mxa.mx_id = m.mix_id
                JOIN UserFriends uf ON m.owner_id = uf.friend_id
                
                UNION ALL
                
                -- Signal 2: Albums friends reviewed
                SELECT r.alb_id, r.u_id as friend_id
                FROM reviews r
                JOIN UserFriends uf ON r.u_id = uf.friend_id
            )
            SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name, COUNT(fi.friend_id) as interaction_weight
            FROM albums a
            JOIN FriendInteractions fi ON a.alb_id = fi.alb_id
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            WHERE a.alb_id NOT IN (
                -- Exclude albums the user already saved
                SELECT mxa2.alb_id
                FROM mixtapes_x_albums mxa2
                JOIN mixtapes m2 ON mxa2.mx_id = m2.mix_id
                WHERE m2.owner_id = :uid
            )
            GROUP BY a.alb_id, a.name, a.cover_url
            ORDER BY interaction_weight DESC, RANDOM() 
            LIMIT 5
        """)
        
        results = db.execute(friend_sql, {"uid": uid}).fetchall()
        
        return [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url} for r in results]

    except Exception as e:
        print(f"Friend Recommendation Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))
    
@router.get("/albums/{album_id}")
def get_album(album_id: int, db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT a.alb_id, a.name as album_name, a.rel_date, a.description, a.cover_url, a.duration, a.n_of_songs, 
                   ar.name as artist_name, a.scene_id
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            WHERE a.alb_id = :aid
        """)
        result = db.execute(sql, {"aid": album_id}).fetchone()
        
        if not result:
            raise HTTPException(status_code=404, detail="Album not found")

        # Fetch Genres
        genre_sql = text("SELECT g.name FROM genres g JOIN albums_x_genres axg ON g.gen_id = axg.gen_id WHERE axg.alb_id = :aid")
        genre_results = db.execute(genre_sql, {"aid": album_id}).fetchall()
        genres = [row.name for row in genre_results]

        return {
            "id": result.alb_id,
            "title": result.album_name,
            "artist": result.artist_name or "Unknown Artist",
            "releaseDate": str(result.rel_date) if result.rel_date else None,
            "description": result.description,
            "coverUrl": result.cover_url,
            "duration": result.duration,
            "trackCount": result.n_of_songs,
            "genres": genres,
            "sceneId": result.scene_id
        }
    except Exception as e:
        print(f"Get Album Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/albums/{album_id}/reviews")
def get_reviews(album_id: int, db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT u.username, r.text, r.date_created, r.date_updated, rt.score
            FROM reviews r
            JOIN users u ON r.u_id = u.u_id
            LEFT JOIN ratings rt ON (r.u_id = rt.u_id AND r.alb_id = rt.alb_id)
            WHERE r.alb_id = :aid
            ORDER BY r.date_created DESC
        """)
        result = db.execute(sql, {"aid": album_id}).fetchall()
        return [
            {
                "user": row.username, 
                "text": row.text, 
                "rating": row.score if row.score else 0, 
                "date": row.date_created.strftime("%Y-%m-%d"),
                "date_updated": row.date_updated.strftime("%Y-%m-%d %H:%M:%S") if row.date_updated else None,
                "created_at": row.date_created.strftime("%Y-%m-%d %H:%M:%S")
            } for row in result
        ]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/reviews")
def post_review(review: ReviewRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": review.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        # 1. Update/Insert Rating
        if review.rating > 0:
            sql_rating = text("INSERT INTO ratings (score, u_id, alb_id) VALUES (:score, :uid, :aid) ON CONFLICT (u_id, alb_id) DO UPDATE SET score = :score")
            db.execute(sql_rating, {"score": review.rating, "uid": user.u_id, "aid": review.album_id})

        # 2. Update/Insert Review
        sql_review = text("""
            INSERT INTO reviews (text, u_id, alb_id, date_created, date_updated) 
            VALUES (:text, :uid, :aid, NOW(), NOW()) 
            ON CONFLICT (u_id, alb_id) 
            DO UPDATE SET text = :text, date_updated = NOW()
        """)
        db.execute(sql_review, {"text": review.text, "uid": user.u_id, "aid": review.album_id})

        db.commit()
        return {"message": "Review saved"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.delete("/albums/{album_id}/reviews")
def delete_review(album_id: int, username: str, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        # Delete from both tables
        db.execute(text("DELETE FROM reviews WHERE u_id = :uid AND alb_id = :aid"), {"uid": user.u_id, "aid": album_id})
        db.execute(text("DELETE FROM ratings WHERE u_id = :uid AND alb_id = :aid"), {"uid": user.u_id, "aid": album_id})
        
        db.commit()
        return {"message": "Review and rating deleted"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/albums/{album_id}/moods")
def get_album_moods(album_id: int, current_user: str = None, db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT m.mood_id, m.name, COUNT(um.u_id) as count
            FROM moods m
            LEFT JOIN user_moods um ON m.mood_id = um.mood_id AND um.alb_id = :aid
            GROUP BY m.mood_id, m.name
            ORDER BY count DESC, m.name ASC
        """)
        results = db.execute(sql, {"aid": album_id}).fetchall()

        user_picked_ids = []
        if current_user:
            user_sql = text("SELECT um.mood_id FROM user_moods um JOIN users u ON um.u_id = u.u_id WHERE u.username = :uname AND um.alb_id = :aid")
            user_picks = db.execute(user_sql, {"uname": current_user, "aid": album_id}).fetchall()
            user_picked_ids = [row.mood_id for row in user_picks]

        return [{"id": r.mood_id, "name": r.name, "count": r.count, "selected": r.mood_id in user_picked_ids} for r in results]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/moods/toggle")
def toggle_mood(req: MoodRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        check_sql = text("SELECT umd_id FROM user_moods WHERE u_id=:uid AND alb_id=:aid AND mood_id=:mid")
        existing = db.execute(check_sql, {"uid": user.u_id, "aid": req.album_id, "mid": req.mood_id}).fetchone()

        if existing:
            db.execute(text("DELETE FROM user_moods WHERE umd_id = :id"), {"id": existing.umd_id})
            action = "removed"
        else:
            db.execute(text("INSERT INTO user_moods (u_id, alb_id, mood_id) VALUES (:uid, :aid, :mid)"), {"uid": user.u_id, "aid": req.album_id, "mid": req.mood_id})
            action = "added"

        db.commit()
        return {"status": "success", "action": action}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/search")
def search(q: str, db: Session = Depends(get_db)):
    """
    Search for artists and albums
    Returns artists with their albums and scenes, and albums with their scenes
    """
    try:
        if not q or len(q) < 2:
            return {"artists": [], "albums": []}
        
        search_pattern = f"{q}%"
        
        # Search for artists
        artists_sql = text("""
            SELECT DISTINCT a.art_id, a.name
            FROM artists a
            WHERE a.name ILIKE :query
            ORDER BY a.name
            LIMIT 10
        """)
        
        artists_result = db.execute(artists_sql, {"query": search_pattern}).fetchall()
        
        artists_data = []
        for artist in artists_result:
            # Get albums for this artist
            albums_sql = text("""
                SELECT DISTINCT alb.alb_id, alb.name, alb.cover_url, alb.rel_date
                FROM albums alb
                JOIN artists_x_albums axa ON alb.alb_id = axa.alb_id
                WHERE axa.art_id = :artist_id
                ORDER BY alb.rel_date DESC
            """)
            
            albums = db.execute(albums_sql, {"artist_id": artist.art_id}).fetchall()
            
            # Get scenes for this artist
            scenes_sql = text("""
                SELECT DISTINCT s.scene_id, s.name, s.image_url, s.official
                FROM scenes s
                WHERE s.name ILIKE '%' || :artist_name || '%' AND s.official = true
                LIMIT 3
            """)
            
            scenes = db.execute(scenes_sql, {"artist_name": artist.name}).fetchall()
            
            artists_data.append({
                "id": artist.art_id,
                "name": artist.name,
                "type": "artist",
                "albums": [
                    {
                        "id": alb.alb_id,
                        "name": alb.name,
                        "coverUrl": alb.cover_url,
                        "releaseDate": str(alb.rel_date) if alb.rel_date else None
                    } for alb in albums
                ],
                "scenes": [
                    {
                        "id": scene.scene_id,
                        "name": scene.name,
                        "imageUrl": scene.image_url,
                        "isOfficial": scene.official
                    } for scene in scenes
                ]
            })
        
        # Search for albums
        albums_sql = text("""
            SELECT DISTINCT 
                alb.alb_id, 
                alb.name, 
                alb.cover_url, 
                alb.rel_date,
                alb.scene_id,
                STRING_AGG(DISTINCT art.name, ', ') as artist_names
            FROM albums alb
            LEFT JOIN artists_x_albums axa ON alb.alb_id = axa.alb_id
            LEFT JOIN artists art ON axa.art_id = art.art_id
            WHERE alb.name ILIKE :query
            GROUP BY alb.alb_id, alb.name, alb.cover_url, alb.rel_date, alb.scene_id
            ORDER BY alb.name
            LIMIT 10
        """)
        
        albums_result = db.execute(albums_sql, {"query": search_pattern}).fetchall()
        
        albums_data = []
        for album in albums_result:
            # Get scenes related to this album
            scenes_sql = text("""
                SELECT scene_id, name, image_url, official
                FROM scenes
                WHERE (scene_id = :scene_id OR name ILIKE '%' || :album_name || '%')
                AND official = true
                LIMIT 3
            """)
            
            scenes = db.execute(scenes_sql, {
                "scene_id": album.scene_id if album.scene_id else -1,
                "album_name": album.name
            }).fetchall()
            
            albums_data.append({
                "id": album.alb_id,
                "name": album.name,
                "artist": album.artist_names or "Unknown Artist",
                "coverUrl": album.cover_url,
                "releaseDate": str(album.rel_date) if album.rel_date else None,
                "type": "album",
                "scenes": [
                    {
                        "id": scene.scene_id,
                        "name": scene.name,
                        "imageUrl": scene.image_url,
                        "isOfficial": scene.official
                    } for scene in scenes
                ]
            })
        
        users_sql = text("""
            SELECT DISTINCT u.u_id, u.username, u.bio, u.prof_pic_url
            FROM users u
            WHERE u.username ILIKE :query
            ORDER BY u.username
            LIMIT 10
        """)
        
        users_result = db.execute(users_sql, {"query": search_pattern}).fetchall()
        
        users_data = [
            {
                "id": user.u_id,
                "username": user.username,
                "bio": user.bio,
                "type": "user"
            } for user in users_result
        ]
        
        return {
            "artists": artists_data,
            "albums": albums_data,
            "users": users_data
        }
    
    except Exception as e:
        print(f"Search error: {e}")
        raise HTTPException(status_code=500, detail=str(e))
    