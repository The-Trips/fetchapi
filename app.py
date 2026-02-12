from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import text
from sqlalchemy.orm import Session
from pydantic import BaseModel
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
        check = db.execute(
            text("SELECT u_id FROM priv_users WHERE email = :email"),
            {"email": req.email}).fetchone()
        if check:
            raise HTTPException(
                status_code=400,
                detail="Email already registered")

        sql = text("""
            INSERT INTO priv_users (email, hash_pw, role, date_created,
                                    last_login, privacy_st, is_silenced)
            VALUES (:email, :pw, 'user', NOW(), NOW(), 1, false)""")

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
            raise HTTPException(
                status_code=404,
                detail="User account not found")

        check_name = db.execute(
            text("SELECT u_id FROM users WHERE username = :name"),
            {"name": req.username}).fetchone()
        if check_name:
            raise HTTPException(status_code=400, detail="Username taken")

        sql = text("""
            INSERT INTO users (u_id, username, bio, prof_pic_url)
            VALUES
            (:uid, :name, 'Music enthusiast.', 'https://placehold.co/150')
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
        sql_priv = text("""
            SELECT u_id FROM priv_users WHERE email = :email AND hash_pw = :pw
                        """)
        priv_user = db.execute(
            sql_priv, {"email": req.email, "pw": req.password}).fetchone()

        if not priv_user:
            raise HTTPException(status_code=401, detail="Invalid credentials")

        sql_pub = text(
            "SELECT username, prof_pic_url FROM users WHERE u_id = :uid")
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

# UPDATED ALBUM ENDPOINT 
@app.get("/api/albums/{album_id}")
def get_album(album_id: int, db: Session = Depends(get_db)):
    try:
        # Updated SQL to include scene_id
        sql = text("""
            SELECT
                a.alb_id,
                a.name AS title,
                a.rel_date AS release_date,
                a.cover_url,
                a.scene_id,
                STRING_AGG(DISTINCT art.name, ', ') AS artists
            FROM albums a
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists art ON axa.art_id = art.art_id
            WHERE a.alb_id = :album_id
            GROUP BY a.alb_id, a.name, a.rel_date, a.cover_url, a.scene_id
        """)
        
        result = db.execute(sql, {"album_id": album_id}).fetchone()
        
        if not result:
            raise HTTPException(status_code=404, detail="Album not found")
        
        return {
            "id": result.alb_id,
            "title": result.title,
            "artist": result.artists or "Unknown Artist",
            "releaseDate": str(result.release_date) if result.release_date else "Unknown",
            "coverUrl": result.cover_url,
            "scene_id": result.scene_id,  # NEW: Include scene_id in response
            "description": None  # Add later if you have a description field
        }
    
    except HTTPException:
        raise
    except Exception as e:
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
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :name"),
            {"name": review.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        user_id = user.u_id

        if review.rating > 0:
            sql_rating = text("""
                INSERT INTO ratings (score, u_id, alb_id)
                VALUES (:score, :uid, :aid)
                ON CONFLICT (u_id, alb_id) DO UPDATE SET score = :score
            """)
            db.execute(
                sql_rating,
                {"score": review.rating,
                 "uid": user_id,
                 "aid": review.album_id})

        sql_review = text("""
            INSERT INTO reviews
            (text, u_id, alb_id, date_created, date_updated)
            VALUES (:text, :uid, :aid, NOW(), NOW())
            ON CONFLICT (u_id, alb_id)
            DO UPDATE SET text = :text, date_updated = NOW()
        """)
        db.execute(
            sql_review,
            {"text": review.text, "uid": user_id, "aid": review.album_id})

        db.commit()
        return {"message": "Review saved"}
    except Exception as e:
        print(f"Post Review Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


# --- PROFILE ROUTES ---

@app.get("/api/users/{username}")
def get_profile(username: str, db: Session = Depends(get_db)):
    try:
        user = db.execute(
            text("""
                 SELECT u_id, username, bio, prof_pic_url
                 FROM users WHERE username = :name"""),
            {"name": username}).fetchone()
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
    
   #-- COMMUNITY ROUTES---

@app.get("/api/scenes")
def get_scenes(db: Session = Depends(get_db)):
    """Get all scenes/communities"""
    try:
        sql = text("""
            SELECT 
                scene_id,
                scene_uid,
                name,
                description,
                image_url,
                date_created,
                date_updated,
                official,
                owner_id,
                followers,
                (SELECT username FROM users WHERE u_id = scenes.owner_id) as creator_username
            FROM scenes
            ORDER BY official DESC, followers DESC
        """)
        
        result = db.execute(sql).fetchall()
        
        scenes = []
        for row in result:
            scenes.append({
                "id": row.scene_id,
                "uid": str(row.scene_uid),
                "name": row.name,
                "description": row.description,
                "imageUrl": row.image_url,
                "isOfficial": row.official,
                "members": row.followers,
                "createdAt": row.date_created.isoformat() if row.date_created else None,
                "createdBy": row.creator_username
            })
        
        return {"scenes": scenes}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/scenes/{scene_id}")
def get_scene(scene_id: int, db: Session = Depends(get_db)):
    """Get a single scene/community"""
    try:
        sql = text("""
            SELECT 
                scene_id,
                scene_uid,
                name,
                description,
                image_url,
                date_created,
                date_updated,
                official,
                owner_id,
                followers,
                (SELECT username FROM users WHERE u_id = scenes.owner_id) as creator_username
            FROM scenes
            WHERE scene_id = :scene_id
        """)
        
        row = db.execute(sql, {"scene_id": scene_id}).fetchone()
        
        if not row:
            raise HTTPException(status_code=404, detail="Scene not found")
        
        return {
            "id": row.scene_id,
            "uid": str(row.scene_uid),
            "name": row.name,
            "description": row.description,
            "imageUrl": row.image_url,
            "isOfficial": row.official,
            "members": row.followers,
            "createdAt": row.date_created.isoformat() if row.date_created else None,
            "createdBy": row.creator_username
        }
    
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/scenes")
def create_scene(scene_data: dict, db: Session = Depends(get_db)):
    """Create a new scene/community"""
    try:
        # Get user ID from username
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": scene_data.get("createdBy")}
        ).fetchone()
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        sql = text("""
            INSERT INTO scenes (name, description, image_url, date_created, date_updated, official, owner_id, followers)
            VALUES (:name, :description, :image_url, NOW(), NOW(), FALSE, :owner_id, 0)
            RETURNING scene_id, scene_uid
        """)
        
        result = db.execute(sql, {
            "name": scene_data.get("name"),
            "description": scene_data.get("description"),
            "image_url": scene_data.get("imageUrl"),
            "owner_id": user.u_id
        }).fetchone()
        
        db.commit()
        
        return {
            "id": result.scene_id,
            "uid": str(result.scene_uid),
            "message": "Scene created successfully"
        }
    
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))


# ---THREAD DISCUSSION ROUTES ----

@app.get("/api/scenes/{scene_id}/threads")
def get_scene_threads(scene_id: int, db: Session = Depends(get_db)):
    """Get all threads/discussions for a scene"""
    try:
        sql = text("""
            SELECT 
                t.t_id,
                t.t_uid,
                t.title,
                t.text,
                t.date_created,
                t.likes,
                t.dislikes,
                u.username,
                (SELECT COUNT(*) FROM replies WHERE thread_id = t.t_id) as reply_count
            FROM threads t
            JOIN users u ON t.u_id = u.u_id
            WHERE t.scene_id = :scene_id
            ORDER BY t.date_created DESC
        """)
        
        result = db.execute(sql, {"scene_id": scene_id}).fetchall()
        
        threads = []
        for row in result:
            threads.append({
                "id": row.t_id,
                "uid": str(row.t_uid),
                "title": row.title,
                "content": row.text,
                "author": row.username,
                "createdAt": row.date_created.isoformat() if row.date_created else None,
                "upvotes": (row.likes or 0) - (row.dislikes or 0),
                "commentCount": row.reply_count,
                "preview": row.text[:100] + "..." if len(row.text) > 100 else row.text
            })
        
        return {"threads": threads}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/threads/{thread_id}")
def get_thread(thread_id: int, db: Session = Depends(get_db)):
    """Get a single thread/discussion with all replies"""
    try:
        #Get thread
        thread_sql = text("""
            SELECT 
                t.t_id,
                t.t_uid,
                t.title,
                t.text,
                t.date_created,
                t.likes,
                t.dislikes,
                u.username,
                t.scene_id
            FROM threads t
            JOIN users u ON t.u_id = u.u_id
            WHERE t.t_id = :thread_id
        """)
        
        thread_row = db.execute(thread_sql, {"thread_id": thread_id}).fetchone()
        
        if not thread_row:
            raise HTTPException(status_code=404, detail="Thread not found")
        
        # Get all replies for this thread
        replies_sql = text("""
            SELECT 
                r.rep_id,
                r.rep_uid,
                r.text,
                r.level,
                r.parent_rep_id,
                r.date_created,
                r.likes,
                r.dislikes,
                u.username
            FROM replies r
            JOIN users u ON r.u_id = u.u_id
            WHERE r.thread_id = :thread_id
            ORDER BY r.date_created ASC
        """)
        
        replies_result = db.execute(replies_sql, {"thread_id": thread_id}).fetchall()
        
        #Nested reply structure
        def build_reply_tree(replies_list, parent_id=None, level=1):
            tree = []
            for reply in replies_list:
                if (parent_id is None and reply.level == 1 and reply.parent_rep_id == thread_id) or \
                   (parent_id is not None and reply.parent_rep_id == parent_id):
                    reply_obj = {
                        "id": reply.rep_id,
                        "uid": str(reply.rep_uid),
                        "author": reply.username,
                        "content": reply.text,
                        "createdAt": reply.date_created.isoformat() if reply.date_created else None,
                        "upvotes": (reply.likes or 0) - (reply.dislikes or 0),
                        "replies": build_reply_tree(replies_list, reply.rep_id, level + 1)
                    }
                    tree.append(reply_obj)
            return tree
        
        comments = build_reply_tree(replies_result)
        
        return {
            "discussion": {
                "id": thread_row.t_id,
                "uid": str(thread_row.t_uid),
                "title": thread_row.title,
                "content": thread_row.text,
                "author": thread_row.username,
                "createdAt": thread_row.date_created.isoformat() if thread_row.date_created else None,
                "upvotes": (thread_row.likes or 0) - (thread_row.dislikes or 0),
                "sceneId": thread_row.scene_id if thread_row.scene_id else None
            },
            "comments": comments
        }
    
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/threads")
def create_thread(thread_data: dict, db: Session = Depends(get_db)):
    """Create a new thread/discussion"""

    try:
        # Get user ID
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": thread_data.get("author")}
        ).fetchone()
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        sql = text("""
            INSERT INTO threads (title, text, date_created, u_id, scene_id, likes, dislikes)
            VALUES (:title, :text, NOW(), :u_id, :scene_id, 0, 0)
            RETURNING t_id, t_uid
        """)
        
        result = db.execute(sql, {
            "title": thread_data.get("title"),
            "text": thread_data.get("content"),
            "u_id": user.u_id,
            "scene_id": thread_data.get("sceneId")
        }).fetchone()
        
        db.commit()
        
        return {
            "id": result.t_id,
            "uid": str(result.t_uid),
            "message": "Thread created successfully"
        }
    
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        print(f"ERROR creating thread: {str(e)}")  # Add this line
        print(f"Thread data received: {thread_data}")  # Add this line
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/replies")
def create_reply(reply_data: dict, db: Session = Depends(get_db)):
    """Create a new reply/comment"""
    try:
        print("=" * 50)
        print("REPLY DATA RECEIVED:", reply_data)
        print("=" * 50)
        
        # Get user ID
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": reply_data.get("author")}
        ).fetchone()
        
        print("USER FOUND:", user)
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        # Determine level and parent_rep_id
        thread_id = reply_data.get("threadId")
        parent_comment_id = reply_data.get("parentCommentId")
        
        if parent_comment_id:
            # This is a reply to a comment
            parent = db.execute(
                text("SELECT level FROM replies WHERE rep_id = :rep_id"),
                {"rep_id": parent_comment_id}
            ).fetchone()
            level = (parent.level + 1) if parent else 1
            parent_rep_id = parent_comment_id
        else:
            # This is a top-level comment
            level = 1
            parent_rep_id = thread_id
        
        sql = text("""
            INSERT INTO replies (text, level, thread_id, parent_rep_id, u_id, date_created, likes, dislikes)
            VALUES (:text, :level, :thread_id, :parent_rep_id, :u_id, NOW(), 0, 0)
            RETURNING rep_id, rep_uid
        """)
        
        result = db.execute(sql, {
            "text": reply_data.get("content"),
            "level": level,
            "thread_id": thread_id,
            "parent_rep_id": parent_rep_id,
            "u_id": user.u_id
        }).fetchone()
        
        db.commit()
        
        return {
            "id": result.rep_id,
            "uid": str(result.rep_uid),
            "message": "Reply created successfully"
        }
    
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        print("ERROR:", str(e))
        raise HTTPException(status_code=500, detail=str(e))
  
