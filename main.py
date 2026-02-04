from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker, Session
from pydantic import BaseModel
from typing import Optional, List
import traceback

DATABASE_URL = "postgresql://postgres:123456@localhost/songapp_db"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)

app = FastAPI()

# Enable React Frontend to talk to Python Backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173","http://localhost:5174","http://localhost:5175", "http://localhost:3000","http://localhost:8000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# --- Pydantic Models (Validation) ---
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

# --- AUTH ROUTES ---

@app.post("/api/register")
def register(req: RegisterRequest, db: Session = Depends(get_db)):
    try:
        check = db.execute(text("SELECT u_id FROM priv_users WHERE email = :email"), {"email": req.email}).fetchone()
        if check:
            raise HTTPException(status_code=400, detail="Email already registered")
        
        sql = text("""
            INSERT INTO priv_users (email, hash_pw, role, date_created, last_login, privacy_st, is_silenced)
            VALUES (:email, :pw, 'user', NOW(), NOW(), 1, false)
        """)
        db.execute(sql, {"email": req.email, "pw": req.password})
        db.commit()
        return {"message": "Registration successful"}
    except Exception as e:
        print(f"Register Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/create-username")
def create_username(req: CreateUserRequest, db: Session = Depends(get_db)):
    try:
        priv_user = db.execute(text("SELECT u_id FROM priv_users WHERE email = :email"), {"email": req.email}).fetchone()
        if not priv_user:
            raise HTTPException(status_code=404, detail="User account not found")
        
        check_name = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.username}).fetchone()
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

# --- HOMEPAGE ROUTES (Must be above generic album route) ---

@app.get("/api/albums/trending")
def get_trending(db: Session = Depends(get_db)):
    try:
        # Changed ORDER BY to RANDOM() so it shuffles every time
        # Used GROUP BY instead of DISTINCT ON to make randomization easier
        sql = text("""
            SELECT 
                a.alb_id, 
                a.name as album_name, 
                a.cover_url,
                MAX(ar.name) as artist_name
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            GROUP BY a.alb_id, a.name, a.cover_url
            ORDER BY RANDOM() 
            LIMIT 10
        """)
        results = db.execute(sql).fetchall()
        
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
        traceback.print_exc()
        raise HTTPException(status_code=500, detail=str(e))
    
@app.get("/api/albums/recommended")
def get_recommended(db: Session = Depends(get_db)):
    try:
        # Reverted to using JOINs and correct column names
        sql = text("""
            SELECT DISTINCT ON (a.alb_id)
                a.alb_id, 
                a.name as album_name, 
                a.cover_url,
                ar.name as artist_name
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            ORDER BY a.alb_id, RANDOM() 
            LIMIT 5
        """)
        results = db.execute(sql).fetchall()
        
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
        print(f"Recommended Error: {e}")
        traceback.print_exc()
        raise HTTPException(status_code=500, detail=str(e))

# --- GENERIC ALBUM ROUTES ---

@app.get("/api/albums/{album_id}")
def get_album(album_id: int, db: Session = Depends(get_db)):
    try:
        # Reverted to use JOINs and correct columns (name, rel_date, cover_url)
        sql = text("""
            SELECT 
                a.alb_id, 
                a.name as album_name, 
                a.rel_date, 
                a.description, 
                a.cover_url,
                ar.name as artist_name
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            WHERE a.alb_id = :aid
        """)
        result = db.execute(sql, {"aid": album_id}).fetchone()
        if not result:
            raise HTTPException(status_code=404, detail="Album not found")
        
        return {
            "id": result.alb_id,
            "title": result.album_name,
            "artist": result.artist_name or "Unknown Artist",
            "releaseDate": str(result.rel_date) if result.rel_date else None,
            "description": result.description,
            "coverUrl": result.cover_url 
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
        
        return [
            {
                "user": row.username, 
                "text": row.text, 
                "rating": row.score if row.score else 0, 
                "date": row.date_created.strftime("%Y-%m-%d")
            } 
            for row in result
        ]
    except Exception as e:
        print(f"Get Reviews Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/reviews")
def post_review(review: ReviewRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": review.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        user_id = user.u_id

        if review.rating > 0:
            sql_rating = text("""
                INSERT INTO ratings (score, u_id, alb_id) VALUES (:score, :uid, :aid)
                ON CONFLICT (u_id, alb_id) DO UPDATE SET score = :score
            """)
            db.execute(sql_rating, {"score": review.rating, "uid": user_id, "aid": review.album_id})

        sql_review = text("""
            INSERT INTO reviews (text, u_id, alb_id, date_created, date_updated) 
            VALUES (:text, :uid, :aid, NOW(), NOW())
            ON CONFLICT (u_id, alb_id) DO UPDATE SET text = :text, date_updated = NOW()
        """)
        db.execute(sql_review, {"text": review.text, "uid": user_id, "aid": review.album_id})
        
        db.commit()
        return {"message": "Review saved"}
    except Exception as e:
        print(f"Post Review Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

# --- PROFILE ROUTES ---

@app.get("/api/users/{username}")
def get_profile(username: str, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id, username, bio, prof_pic_url FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        # Reverted to JOINs
        reviews = db.execute(text("""
            SELECT 
                r.text, 
                r.date_created, 
                a.name as album_name, 
                ar.name as artist_name, 
                rt.score 
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
            "reviews": [
                {
                    "album": r.album_name,
                    "artist": r.artist_name or "Unknown Artist",
                    "rating": r.score if r.score else 0,
                    "text": r.text,
                    "date": r.date_created.strftime("%Y-%m-%d")
                } for r in reviews
            ]
        }
    except Exception as e:
        print(f"Get Profile Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))