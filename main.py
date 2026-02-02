from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from pydantic import BaseModel
from typing import Optional

DATABASE_URL = "postgresql://postgres:123456@localhost/songapp_db"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)

app = FastAPI()

# Enable React Frontend to talk to Python Backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost:3000"],
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
def register(req: RegisterRequest, db=Depends(get_db)):
    # Check if email exists
    check = db.execute(text("SELECT u_id FROM priv_users WHERE email = :email"), {"email": req.email}).fetchone()
    if check:
        raise HTTPException(status_code=400, detail="Email already registered")
    
    # Insert into priv_users
    sql = text("""
        INSERT INTO priv_users (email, hash_pw, role, date_created, last_login, privacy_st, is_silenced)
        VALUES (:email, :pw, 'user', NOW(), NOW(), 1, false)
        RETURNING u_id
    """)
    db.execute(sql, {"email": req.email, "pw": req.password})
    db.commit()
    return {"message": "Registration successful"}

@app.post("/api/create-username")
def create_username(req: CreateUserRequest, db=Depends(get_db)):
    # 1. Get private user ID
    priv_user = db.execute(text("SELECT u_id FROM priv_users WHERE email = :email"), {"email": req.email}).fetchone()
    if not priv_user:
        raise HTTPException(status_code=404, detail="User account not found")
    
    # 2. Check if username taken
    check_name = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.username}).fetchone()
    if check_name:
        raise HTTPException(status_code=400, detail="Username taken")

    # 3. Create Public Profile
    sql = text("""
        INSERT INTO users (u_id, username, bio, prof_pic_url)
        VALUES (:uid, :name, 'Music enthusiast.', 'https://placehold.co/150')
    """)
    db.execute(sql, {"uid": priv_user.u_id, "name": req.username})
    db.commit()
    return {"message": "Profile created"}

@app.post("/api/login")
def login(req: LoginRequest, db=Depends(get_db)):
    # 1. Verify Login
    sql_priv = text("SELECT u_id FROM priv_users WHERE email = :email AND hash_pw = :pw")
    priv_user = db.execute(sql_priv, {"email": req.email, "pw": req.password}).fetchone()
    
    if not priv_user:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    
    # 2. Get Public Username
    sql_pub = text("SELECT username, prof_pic_url FROM users WHERE u_id = :uid")
    pub_user = db.execute(sql_pub, {"uid": priv_user.u_id}).fetchone()
    
    if not pub_user:
        return {"status": "incomplete", "email": req.email}

    return {
        "status": "success",
        "username": pub_user.username,
        "avatar": pub_user.prof_pic_url
    }

# --- ALBUM & REVIEW ROUTES ---

@app.get("/api/albums/{album_id}")
def get_album(album_id: int, db=Depends(get_db)):
    # Fetches album info matching your frontend state names
    sql = text("""
        SELECT a.alb_id, a.title, a.art_name, a.release_date, a.description, a.img_url 
        FROM albums a 
        WHERE a.alb_id = :aid
    """)
    result = db.execute(sql, {"aid": album_id}).fetchone()
    if not result:
        raise HTTPException(status_code=404, detail="Album not found")
    
    return {
        "id": result.alb_id,
        "title": result.title,
        "artist": result.art_name,
        "releaseDate": result.release_date,
        "description": result.description,
        "coverUrl": result.img_url # Matches your frontend expectation
    }

@app.get("/api/albums/{album_id}/reviews")
def get_reviews(album_id: int, db=Depends(get_db)):
    sql = text("""
        SELECT u.username, r.text, r.date_created, rt.score
        FROM reviews r
        JOIN users u ON r.u_id = u.u_id
        LEFT JOIN ratings rt ON (r.u_id = rt.u_id AND r.alb_id = rt.alb_id)
        WHERE r.alb_id = :aid
        ORDER BY r.date_created DESC
    """)
    result = db.execute(sql, {"aid": album_id}).fetchall()
    
    # Matches your frontend map: r.user, r.text, r.rating, r.date
    return [
        {
            "user": row.username, 
            "text": row.text, 
            "rating": row.score if row.score else 0, 
            "date": row.date_created.strftime("%Y-%m-%d")
        } 
        for row in result
    ]

@app.post("/api/reviews")
def post_review(review: ReviewRequest, db=Depends(get_db)):
    # 1. Get User ID from Username
    user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": review.username}).fetchone()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    
    user_id = user.u_id

    # 2. Save Rating (Upsert)
    if review.rating > 0:
        sql_rating = text("""
            INSERT INTO ratings (score, u_id, alb_id) VALUES (:score, :uid, :aid)
            ON CONFLICT (u_id, alb_id) DO UPDATE SET score = :score
        """)
        db.execute(sql_rating, {"score": review.rating, "uid": user_id, "aid": review.album_id})

    # 3. Save Review (Upsert)
    sql_review = text("""
        INSERT INTO reviews (text, u_id, alb_id, date_created, date_updated) 
        VALUES (:text, :uid, :aid, NOW(), NOW())
        ON CONFLICT (u_id, alb_id) DO UPDATE SET text = :text, date_updated = NOW()
    """)
    db.execute(sql_review, {"text": review.text, "uid": user_id, "aid": review.album_id})
    
    db.commit()
    return {"message": "Review saved"}

# --- PROFILE ROUTES ---

@app.get("/api/users/{username}")
def get_profile(username: str, db=Depends(get_db)):
    # Get User Info
    user = db.execute(text("SELECT u_id, username, bio, prof_pic_url FROM users WHERE username = :name"), {"name": username}).fetchone()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Get User's Reviews
    reviews = db.execute(text("""
        SELECT r.text, r.date_created, a.title, a.art_name, rt.score 
        FROM reviews r
        JOIN albums a ON r.alb_id = a.alb_id
        LEFT JOIN ratings rt ON (r.u_id = rt.u_id AND r.alb_id = rt.alb_id)
        WHERE r.u_id = :uid
    """), {"uid": user.u_id}).fetchall()

    return {
        "username": user.username,
        "bio": user.bio,
        "avatar": user.prof_pic_url,
        "reviews": [
            {
                "album": r.title,
                "artist": r.art_name,
                "rating": r.score,
                "text": r.text,
                "date": r.date_created.strftime("%Y-%m-%d")
            } for r in reviews
        ]
    }