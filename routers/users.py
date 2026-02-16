from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db

router = APIRouter(prefix="/api", tags=["users"])

@router.get("/users/{username}")
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
