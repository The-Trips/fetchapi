from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from schemas import ReviewRequest, MoodRequest

router = APIRouter(prefix="/api", tags=["albums"])

@router.get("/albums/trending")
def get_trending(db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT a.alb_id, a.name as album_name, a.cover_url, MAX(ar.name) as artist_name
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            GROUP BY a.alb_id, a.name, a.cover_url
            ORDER BY RANDOM() LIMIT 10
        """)
        results = db.execute(sql).fetchall()
        return [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url} for r in results]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/albums/recommended")
def get_recommended(db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT DISTINCT ON (a.alb_id) a.alb_id, a.name as album_name, a.cover_url, ar.name as artist_name
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            ORDER BY a.alb_id, RANDOM() LIMIT 5
        """)
        results = db.execute(sql).fetchall()
        return [{"id": r.alb_id, "title": r.album_name, "artist": r.artist_name or "Unknown", "coverUrl": r.cover_url} for r in results]
    except Exception as e:
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
            SELECT u.username, r.text, r.date_created, rt.score
            FROM reviews r
            JOIN users u ON r.u_id = u.u_id
            LEFT JOIN ratings rt ON (r.u_id = rt.u_id AND r.alb_id = rt.alb_id)
            WHERE r.alb_id = :aid
            ORDER BY r.date_created DESC
        """)
        result = db.execute(sql, {"aid": album_id}).fetchall()
        return [{"user": row.username, "text": row.text, "rating": row.score if row.score else 0, "date": row.date_created.strftime("%Y-%m-%d")} for row in result]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/reviews")
def post_review(review: ReviewRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": review.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        if review.rating > 0:
            sql_rating = text("INSERT INTO ratings (score, u_id, alb_id) VALUES (:score, :uid, :aid) ON CONFLICT (u_id, alb_id) DO UPDATE SET score = :score")
            db.execute(sql_rating, {"score": review.rating, "uid": user.u_id, "aid": review.album_id})

        sql_review = text("INSERT INTO reviews (text, u_id, alb_id, date_created, date_updated) VALUES (:text, :uid, :aid, NOW(), NOW()) ON CONFLICT (u_id, alb_id) DO UPDATE SET text = :text, date_updated = NOW()")
        db.execute(sql_review, {"text": review.text, "uid": user.u_id, "aid": review.album_id})

        db.commit()
        return {"message": "Review saved"}
    except Exception as e:
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
