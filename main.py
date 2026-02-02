# backend/main.py
from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

# ⚠️ UPDATE YOUR DATABASE CREDENTIALS HERE
DATABASE_URL = "postgresql://postgres:123456@localhost/songapp_db"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)

app = FastAPI()

# --- CORS: must be added so all responses (including errors) get CORS headers ---
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173",
        "http://127.0.0.1:5173",
        "http://localhost:5174",
        "http://127.0.0.1:5174",
        "http://localhost:5175",
        "http://localhost:3000",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
    expose_headers=["*"],
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# --- ROUTES ---

@app.get("/")
def read_root():
    return {"message": "API is running!"}

# 1. HOMEPAGE: Recommended Albums
@app.get("/api/albums/recommended")
def get_recommended(db=Depends(get_db)):
    try:
        sql = text("""
            SELECT al.alb_id, al.name, ar.name as artist_name, al.cover_url, al.description
            FROM albums al
            JOIN artists_x_albums axa ON al.alb_id = axa.alb_id
            JOIN artists ar ON axa.art_id = ar.art_id
            LIMIT 5
        """)
        result = db.execute(sql).fetchall()
        return [{
            "id": row.alb_id,
            "title": row.name,
            "artist": row.artist_name,
            "coverUrl": row.cover_url or "",
            "description": row.description or "",
        } for row in result]
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Database error: {e!s}")

# 2. HOMEPAGE: Trending Albums
@app.get("/api/albums/trending")
def get_trending(db=Depends(get_db)):
    try:
        sql = text("""
            SELECT al.alb_id, al.name, ar.name as artist_name, al.cover_url
            FROM albums al
            JOIN artists_x_albums axa ON al.alb_id = axa.alb_id
            JOIN artists ar ON axa.art_id = ar.art_id
            ORDER BY RANDOM()
            LIMIT 6
        """)
        result = db.execute(sql).fetchall()
        return [{"id": row.alb_id, "title": row.name, "artist": row.artist_name, "coverUrl": row.cover_url or ""} for row in result]
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Database error: {e!s}")

# 3. ALBUM PAGE: Single Album Details
@app.get("/api/albums/{album_id}")
def get_album_details(album_id: int, db=Depends(get_db)):
    sql = text("""
        SELECT al.alb_id, al.name, ar.name as artist_name, al.cover_url, al.description, al.rel_date
        FROM albums al
        JOIN artists_x_albums axa ON al.alb_id = axa.alb_id
        JOIN artists ar ON axa.art_id = ar.art_id
        WHERE al.alb_id = :aid
    """)
    row = db.execute(sql, {"aid": album_id}).fetchone()
    
    if not row:
        raise HTTPException(status_code=404, detail="Album not found")
        
    return {
        "id": row.alb_id,
        "title": row.name,
        "artist": row.artist_name,
        "coverUrl": row.cover_url,
        "description": row.description,
        "releaseDate": row.rel_date
    }