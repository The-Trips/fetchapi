# fetchapi/app.py

from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import text
from sqlalchemy.orm import Session
from pydantic import BaseModel
from typing import List, Optional
import traceback

from db import get_db

app = FastAPI()

# Enable React Frontend to talk to Python Backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost:5174",
                   "http://localhost:5175", "http://localhost:3000",
                   "http://localhost:8000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# --- Pydantic Models ---
class RegisterRequest(BaseModel):
    name: str
    email: str
    password: str

class CreateUserRequest(BaseModel):
    email: str
    username: str

class LoginRequest(BaseModel):
    email: str
    password: str

class ReviewRequest(BaseModel):
    album_id: int
    rating: int
    text: str
    username: str

class MoodRequest(BaseModel):
    album_id: int
    mood_id: int
    username: str

# -- NEW COMMUNITY MODELS --
class CreateCommunityRequest(BaseModel):
    name: str
    description: str
    image_url: Optional[str] = None
    username: str

class CreateThreadRequest(BaseModel):
    title: str
    text: str
    username: str
    community_id: int


# --- AUTH ROUTES ---

@app.post("/api/register")
def register(req: RegisterRequest, db: Session = Depends(get_db)):
    try:
        check = db.execute(
            text("SELECT u_id FROM priv_users WHERE email = :email"),
            {"email": req.email}).fetchone()
        if check:
            raise HTTPException(status_code=400, detail="Email already registered")

        sql = text("""
            INSERT INTO priv_users (email, hash_pw, role, date_created,
                                    last_login, privacy_st, is_silenced)
            VALUES (:email, :pw, 'user', NOW(), NOW(), 200, false)""")

        db.execute(sql, {"email": req.email, "pw": req.password})
        db.commit()
        return {"message": "Registration successful"}
    except Exception as e:
        print(f"Register Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/create-username")
def create_username(req: CreateUserRequest, db: Session = Depends(get_db)):
    try:
        priv_user = db.execute(
            text("SELECT u_id FROM priv_users WHERE email = :email"),
            {"email": req.email}).fetchone()
        if not priv_user:
            raise HTTPException(status_code=404, detail="User account not found")

        check_name = db.execute(
            text("SELECT u_id FROM users WHERE username = :name"),
            {"name": req.username}).fetchone()
        if check_name:
            raise HTTPException(status_code=400, detail="Username taken")

        sql = text("""
            INSERT INTO users (u_id, username, bio, prof_pic_url)
            VALUES (:uid, :name, 'Music enthusiast.', 'https://placehold.co/150')
        """)
        db.execute(sql, {"uid": priv_user.u_id, "name": req.username})
        db.commit()
        return {"message": "Profile created"}
    except Exception as e:
        print(f"Create Username Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/login")
def login(req: LoginRequest, db: Session = Depends(get_db)):
    try:
        sql_priv = text("SELECT u_id FROM priv_users WHERE email = :email AND hash_pw = :pw")
        priv_user = db.execute(sql_priv, {"email": req.email, "pw": req.password}).fetchone()

        if not priv_user:
            raise HTTPException(status_code=401, detail="Invalid credentials")

        sql_pub = text("SELECT username, prof_pic_url FROM users WHERE u_id = :uid")
        pub_user = db.execute(sql_pub, {"uid": priv_user.u_id}).fetchone()

        if not pub_user:
            return {"status": "incomplete", "email": req.email}

        return {
            "status": "success",
            "username": pub_user.username,
            "avatar": pub_user.prof_pic_url
        }
    except Exception as e:
        print(f"Login Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


# --- COMMUNITY (SCENES) ROUTES ---

@app.get("/api/communities")
def get_communities(db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT s.scene_id, s.name, s.description, s.image_url, s.followers, u.username as owner
            FROM scenes s
            JOIN users u ON s.owner_id = u.u_id
            ORDER BY s.followers DESC
        """)
        results = db.execute(sql).fetchall()
        return [
            {
                "id": r.scene_id,
                "name": r.name,
                "description": r.description,
                "imageUrl": r.image_url,
                "followers": r.followers,
                "owner": r.owner
            } for r in results
        ]
    except Exception as e:
        print(f"Get Communities Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/communities/{scene_id}")
def get_community_detail(scene_id: int, db: Session = Depends(get_db)):
    try:
        # Get Community Info
        scene = db.execute(text("SELECT * FROM scenes WHERE scene_id = :id"), {"id": scene_id}).fetchone()
        if not scene:
            raise HTTPException(status_code=404, detail="Community not found")
        
        # Get Threads (Discussions)
        threads_sql = text("""
            SELECT t.t_id, t.title, t.text, t.date_created, u.username, t.likes
            FROM threads t
            JOIN users u ON t.u_id = u.u_id
            WHERE t.scene_id = :sid
            ORDER BY t.date_created DESC
        """)
        threads = db.execute(threads_sql, {"sid": scene_id}).fetchall()

        return {
            "id": scene.scene_id,
            "name": scene.name,
            "description": scene.description,
            "imageUrl": scene.image_url,
            "threads": [
                {
                    "id": t.t_id,
                    "title": t.title,
                    "text": t.text,
                    "author": t.username,
                    "likes": t.likes,
                    "date": str(t.date_created)
                } for t in threads
            ]
        }
    except Exception as e:
        print(f"Get Community Detail Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/communities")
def create_community(req: CreateCommunityRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        sql = text("""
            INSERT INTO scenes (name, description, image_url, official, owner_id, followers, date_created, date_updated)
            VALUES (:name, :desc, :img, false, :uid, 0, NOW(), NOW())
            RETURNING scene_id
        """)
        result = db.execute(sql, {"name": req.name, "desc": req.description, "img": req.image_url, "uid": user.u_id}).fetchone()
        db.commit()
        return {"id": result.scene_id, "message": "Community created"}
    except Exception as e:
        print(f"Create Community Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/threads")
def create_thread(req: CreateThreadRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        sql = text("""
            INSERT INTO threads (title, text, u_id, scene_id, likes, dislikes, date_created)
            VALUES (:title, :text, :uid, :sid, 0, 0, NOW())
            RETURNING t_id
        """)
        result = db.execute(sql, {"title": req.title, "text": req.text, "uid": user.u_id, "sid": req.community_id}).fetchone()
        db.commit()
        return {"id": result.t_id, "message": "Discussion started"}
    except Exception as e:
        print(f"Create Thread Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


# --- ALBUM & REVIEW ROUTES ---

@app.get("/api/albums/trending")
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

@app.get("/api/albums/recommended")
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

@app.get("/api/albums/{album_id}")
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
            "sceneId": result.scene_id  # Used to link to Community
        }
    except Exception as e:
        print(f"Get Album Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/albums/{album_id}/reviews")
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

@app.post("/api/reviews")
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

@app.get("/api/albums/{album_id}/moods")
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

@app.post("/api/moods/toggle")
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

@app.get("/api/users/{username}")
def get_profile(username: str, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id, username, bio, prof_pic_url FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        reviews = db.execute(text("""
            SELECT r.text, r.date_created, a.name as album_name, ar.name as artist_name, rt.score
            FROM reviews r
            JOIN albums a ON r.alb_id = a.alb_id
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            LEFT JOIN ratings rt ON (r.u_id = rt.u_id AND r.alb_id = rt.alb_id)
            WHERE r.u_id = :uid
            ORDER BY r.date_created DESC
        """), {"uid": user.u_id}).fetchall()

        return {
            "username": user.username,
            "bio": user.bio,
            "avatar": user.prof_pic_url,
            "reviews": [{"album": r.album_name, "artist": r.artist_name or "Unknown", "rating": r.score or 0, "text": r.text, "date": r.date_created.strftime("%Y-%m-%d")} for r in reviews]
        }
    except HTTPException:
        raise 
    except Exception as e:
        print(f"Get Profile Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))