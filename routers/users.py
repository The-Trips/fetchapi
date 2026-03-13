from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from typing import Optional

from schemas import UserProfileUpdate # Import the new schema
from schemas import CreateListRequest, AddToListRequest, FollowUserRequest # Import list-related schemas

router = APIRouter(prefix="/api", tags=["users"])

@router.get("/users/{username}")
def get_profile(username: str, current_user: Optional[str] = None, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id, username, bio, prof_pic_url, insta_url, twitter_url, website_url, is_private, has_unread_followers FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        # --- NEW: Check for Mutual Following ---
        is_mutual = False
        if current_user and current_user != username:
            cu_record = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": current_user}).fetchone()
            if cu_record:
                cu_follows_user = db.execute(text("SELECT 1 FROM followings WHERE u_id = :cuid AND following_id = :uid"), {"cuid": cu_record.u_id, "uid": user.u_id}).fetchone()
                user_follows_cu = db.execute(text("SELECT 1 FROM followings WHERE u_id = :uid AND following_id = :cuid"), {"uid": user.u_id, "cuid": cu_record.u_id}).fetchone()
                if cu_follows_user and user_follows_cu:
                    is_mutual = True

        # Get Reviews
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

        # Get Followings
        followings = db.execute(text("""
            SELECT u2.username, u2.prof_pic_url
            FROM followings f
            JOIN users u2 ON f.following_id = u2.u_id
            WHERE f.u_id = :uid
        """), {"uid": user.u_id}).fetchall()

        # Get Followers
        followers = db.execute(text("""
            SELECT u1.username, u1.prof_pic_url
            FROM followings f
            JOIN users u1 ON f.u_id = u1.u_id
            WHERE f.following_id = :uid
        """), {"uid": user.u_id}).fetchall()

        # Get Scenes Following
        scenes = db.execute(text("""
            SELECT s.scene_id, s.name, s.image_url
            FROM scene_followers sf
            JOIN scenes s ON sf.scene_id = s.scene_id
            WHERE sf.u_id = :uid
        """), {"uid": user.u_id}).fetchall()

        lists = db.execute(text("""
            SELECT ul.list_id, ul.name,
                   (SELECT a.cover_url FROM list_items li JOIN albums a ON li.alb_id = a.alb_id WHERE li.list_id = ul.list_id LIMIT 1) as cover
            FROM user_lists ul
            WHERE ul.u_id = :uid
            ORDER BY ul.date_created DESC
        """), {"uid": user.u_id}).fetchall()

        return {
            "username": user.username,
            "bio": user.bio,
            "avatar": user.prof_pic_url or "https://ui-avatars.com/api/?name=" + user.username + "&background=random",
            "insta_url": user.insta_url,
            "twitter_url": user.twitter_url,
            "website_url": user.website_url,
            "is_private": user.is_private,
            "has_unread_followers": user.has_unread_followers,
            "is_mutual": is_mutual,
            "reviews": [{"album": r.album_name, "artist": r.artist_name or "Unknown", "rating": r.score or 0, "text": r.text, "date": r.date_created.strftime("%Y-%m-%d") if r.date_created else "Unknown"} for r in reviews],
            "followings": [{"username": f.username, "avatar": f.prof_pic_url or "https://ui-avatars.com/api/?name=" + f.username} for f in followings],
            "followers": [{"username": f.username, "avatar": f.prof_pic_url or "https://ui-avatars.com/api/?name=" + f.username} for f in followers],
            "scenes": [{"id": s.scene_id, "name": s.name, "image": s.image_url} for s in scenes],
            "lists": [{"id": l.list_id, "name": l.name, "cover": l.cover} for l in lists]
        }
    except HTTPException:
        raise 
    except Exception as e:
        print(f"Get Profile Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.put("/users/{username}")
def update_profile(username: str, data: UserProfileUpdate, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        db.execute(text("""
            UPDATE users 
            SET bio = COALESCE(:bio, bio), 
                prof_pic_url = COALESCE(:pic, prof_pic_url),
                insta_url = COALESCE(:insta, insta_url),
                twitter_url = COALESCE(:twitter, twitter_url),
                website_url = COALESCE(:website, website_url),
                is_private = COALESCE(:is_private, is_private),
                has_unread_followers = COALESCE(:has_unread, has_unread_followers)
            WHERE username = :name
        """), {
            "bio": data.bio, 
            "pic": data.prof_pic_url, 
            "insta": data.insta_url,
            "twitter": data.twitter_url,
            "website": data.website_url,
            "is_private": data.is_private,
            "has_unread": data.has_unread_followers,
            "name": username
        })
        
        db.commit()
        return {"message": "Profile updated successfully"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    
@router.post("/users/{username}/lists")
def create_list(username: str, req: CreateListRequest, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        sql = text("INSERT INTO user_lists (u_id, name) VALUES (:uid, :name) RETURNING list_id")
        result = db.execute(sql, {"uid": user.u_id, "name": req.name}).fetchone()
        db.commit()
        return {"id": result[0], "message": "List created successfully"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/lists/add")
def add_to_list(req: AddToListRequest, db: Session = Depends(get_db)):
    try:
        # Check to avoid duplicates
        check = db.execute(text("SELECT * FROM list_items WHERE list_id = :lid AND alb_id = :aid"), 
                           {"lid": req.list_id, "aid": req.album_id}).fetchone()
        if check:
            return {"message": "Album already in list"}

        db.execute(text("INSERT INTO list_items (list_id, alb_id) VALUES (:lid, :aid)"), 
                   {"lid": req.list_id, "aid": req.album_id})
        db.commit()
        return {"message": "Added to list!"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    

@router.get("/lists/{list_id}")
def get_list_details(list_id: int, db: Session = Depends(get_db)):
    try:
        # Get the list name to use as the modal title
        list_info = db.execute(
            text("SELECT name FROM user_lists WHERE list_id = :lid"), 
            {"lid": list_id}
        ).fetchone()
        
        if not list_info:
            raise HTTPException(status_code=404, detail="List not found")

        # Fetch the albums inside this list
        albums = db.execute(text("""
            SELECT a.alb_id, a.name AS album_name, a.cover_url, ar.name AS artist_name
            FROM list_items li
            JOIN albums a ON li.alb_id = a.alb_id
            LEFT JOIN artists_x_albums axa ON a.alb_id = axa.alb_id
            LEFT JOIN artists ar ON axa.art_id = ar.art_id
            WHERE li.list_id = :lid
            ORDER BY li.date_added DESC
        """), {"lid": list_id}).fetchall()

        return {
            "list_id": list_id,
            "list_name": list_info.name,
            "albums": [
                {
                    "id": row.alb_id,
                    "title": row.album_name,
                    "cover": row.cover_url,
                    "artist": row.artist_name or "Unknown Artist"
                } for row in albums
            ]
        }
    except HTTPException:
        raise
    except Exception as e:
        print(f"Get List Details Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.delete("/lists/{list_id}")
def delete_list(list_id: int, db: Session = Depends(get_db)):
    try:
        db.execute(text("DELETE FROM user_lists WHERE list_id = :lid"), {"lid": list_id})
        db.commit()
        return {"message": "List deleted successfully"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.delete("/lists/{list_id}/albums/{album_id}")
def remove_from_list(list_id: int, album_id: int, db: Session = Depends(get_db)):
    try:
        db.execute(text("DELETE FROM list_items WHERE list_id = :lid AND alb_id = :aid"), 
                   {"lid": list_id, "aid": album_id})
        db.commit()
        return {"message": "Album removed from list"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

# Add to the bottom of users.py
@router.post("/users/{target_username}/follow")
def toggle_follow_user(target_username: str, req: FollowUserRequest, db: Session = Depends(get_db)):
    try:
        follower = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.current_username}).fetchone()
        if not follower:
            raise HTTPException(status_code=404, detail="Current user not found")

        target = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": target_username}).fetchone()
        if not target:
            raise HTTPException(status_code=404, detail="Target user not found")

        if follower.u_id == target.u_id:
            raise HTTPException(status_code=400, detail="Cannot follow yourself")

        exists = db.execute(text("SELECT * FROM followings WHERE u_id = :uid AND following_id = :fid"), 
                            {"uid": follower.u_id, "fid": target.u_id}).fetchone()

        if exists:
            db.execute(text("DELETE FROM followings WHERE u_id = :uid AND following_id = :fid"), 
                       {"uid": follower.u_id, "fid": target.u_id})
            db.commit()
            return {"message": "Unfollowed", "isFollowing": False}
        else:
            db.execute(text("INSERT INTO followings (u_id, following_id, is_friend) VALUES (:uid, :fid, false)"), 
                       {"uid": follower.u_id, "fid": target.u_id})
            # --- NEW: Trigger the unread glow effect for the target user ---
            db.execute(text("UPDATE users SET has_unread_followers = true WHERE u_id = :fid"), {"fid": target.u_id})
            db.commit()
            return {"message": "Followed", "isFollowing": True}
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))