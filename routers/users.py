from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from typing import Optional

from schemas import UserProfileUpdate, UserMoodUpdate # Import the new schema
from schemas import CreateListRequest, AddToListRequest, FollowUserRequest # Import list-related schemas
from routers.notifications import create_notification

router = APIRouter(prefix="/api", tags=["users"])

@router.get("/users/{username}")
def get_profile(username: str, current_user: Optional[str] = None, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("""
            SELECT u.u_id, u.username, u.bio, u.prof_pic_url, u.insta_url, u.twitter_url, u.website_url, u.has_unread_followers, pu.privacy_st
            FROM users u
            JOIN priv_users pu ON u.u_id = pu.u_id
            WHERE u.username = :name
        """), {"name": username}).fetchone()

        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        # --- NEW: Check for Mutual Following ---
        is_mutual = False
        if current_user and current_user != username:
            cu_record = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": current_user}).fetchone()
            if cu_record:
                # Optimized check for mutual follow
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
            "privacy_status": user.privacy_st,
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
                has_unread_followers = COALESCE(:has_unread, has_unread_followers)
            WHERE username = :name
        """), {
            "bio": data.bio, 
            "pic": data.prof_pic_url, 
            "insta": data.insta_url,
            "twitter": data.twitter_url,
            "website": data.website_url,
            "has_unread": data.has_unread_followers,
            "name": username
        })
        
        if data.privacy_status is not None:
             db.execute(text("UPDATE priv_users SET privacy_st = :st WHERE u_id = :uid"), {"st": data.privacy_status, "uid": user.u_id})
        
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
            db.execute(text("UPDATE users SET has_unread_followers = true WHERE u_id = :fid"), {"fid": target.u_id})
    
            # Notifications
            # Checks if this is a follow-back (mutual follow)
            already_follows_back = db.execute(
                text("SELECT * FROM followings WHERE u_id = :target_id AND following_id = :follower_id"),
                {"target_id": target.u_id, "follower_id": follower.u_id}
            ).fetchone()

            # Only create notification if NOT a follow-back
            if not already_follows_back:
                create_notification(
                    db=db,
                    recipient_id=target.u_id,
                    actor_id=follower.u_id,
                    entity_id=follower.u_id,
                    entity_type="follow"
                )      
            db.commit()         
            return {"message": "Followed", "isFollowing": True}
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.delete("/users/{username}")
def delete_user(username: str, db: Session = Depends(get_db)):
    try:
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        # Delete from priv_users to cascade to users and everything else
        db.execute(text("DELETE FROM priv_users WHERE u_id = :uid"), {"uid": user.u_id})
        db.commit()
        return {"message": "User account deleted successfully"}
    except Exception as e:
        db.rollback()
        print(f"Delete User Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))
    
@router.put("/users/{username}/current-mood")
def update_current_mood(username: str, req: UserMoodUpdate, db: Session = Depends(get_db)):
    try:
        sql = text("UPDATE users SET current_mood = :mood WHERE username = :name")
        db.execute(sql, {"mood": req.mood, "name": username})
        db.commit()
        return {"status": "success", "current_mood": req.mood}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    
@router.put("/users/{username}")
def update_user_profile(username: str, req: UserProfileUpdate, db: Session = Depends(get_db)):
    try:
        sql = text("""
            UPDATE users 
            SET bio = :bio, insta_url = :insta_url, twitter_url = :twitter_url, website_url = :website_url
            WHERE username = :username
        """)
        db.execute(sql, {
            "bio": req.bio,
            "insta_url": req.insta_url,
            "twitter_url": req.twitter_url,
            "website_url": req.website_url,
            "username": username
        })
        db.commit()
        return {"status": "success"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/users/{username}/friend-activity")
def get_friend_activity(username: str, db: Session = Depends(get_db)):
    try:
        import datetime
        user = db.execute(text("SELECT u_id FROM users WHERE username = :u"), {"u": username}).fetchone()
        if not user:
            raise HTTPException(404, "User not found")
        u_id = user.u_id

        # Get followings (excluding private users)
        followings = db.execute(text("""
            SELECT u.u_id, u.username
            FROM followings f
            JOIN users u ON f.following_id = u.u_id
            JOIN priv_users pu ON u.u_id = pu.u_id
            WHERE f.u_id = :uid AND pu.privacy_st = 200
        """), {"uid": u_id}).fetchall()

        if not followings:
            return []

        following_ids = [f.u_id for f in followings]
        if len(following_ids) == 1:
            in_clause = f"= {following_ids[0]}"
        else:
            in_clause = f"IN {tuple(following_ids)}"

        activities = []

        # 1. Reviews
        reviews = db.execute(text(f"""
            SELECT r.rv_id, r.text, r.date_created, u.username, a.name as target_name, a.alb_id as target_id
            FROM reviews r
            JOIN users u ON r.u_id = u.u_id
            JOIN albums a ON r.alb_id = a.alb_id
            WHERE r.u_id {in_clause}
            ORDER BY r.date_created DESC LIMIT 5
        """)).fetchall()
        
        for r in reviews:
            activities.append({
                "id": f"rev_{r.rv_id}",
                "user": r.username,
                "action": "reviewed",
                "target": r.target_name,
                "time": r.date_created,
                "link": f"/album/{r.target_id}"
            })
            
        # 2. Threads
        threads = db.execute(text(f"""
            SELECT t.t_id, t.title, t.date_created, u.username, s.name as target_name, s.scene_id as target_id
            FROM threads t
            JOIN users u ON t.u_id = u.u_id
            JOIN scenes s ON t.scene_id = s.scene_id
            WHERE t.u_id {in_clause}
            ORDER BY t.date_created DESC LIMIT 5
        """)).fetchall()
        for t in threads:
            activities.append({
                "id": f"thr_{t.t_id}",
                "user": t.username,
                "action": "wrote a thread in",
                "target": t.target_name,
                "time": t.date_created,
                "link": f"/scenes/{t.target_id}/thread/{t.t_id}"
            })
            
        # 3. Replies
        replies = db.execute(text(f"""
            SELECT r.rep_id, r.date_created, u.username, t.title as target_name, t.scene_id, t.t_id
            FROM replies r
            JOIN users u ON r.u_id = u.u_id
            JOIN threads t ON r.thread_id = t.t_id
            WHERE r.u_id {in_clause}
            ORDER BY r.date_created DESC LIMIT 5
        """)).fetchall()
        for r in replies:
            activities.append({
                "id": f"rep_{r.rep_id}",
                "user": r.username,
                "action": "replied to",
                "target": r.target_name,
                "time": r.date_created,
                "link": f"/scenes/{r.scene_id}/thread/{r.t_id}"
            })
            
        # 4. Likes (reactions)
        reactions = db.execute(text(f"""
            SELECT v.v_id, v.ent_type, v.ent_id, u.username
            FROM reactions v
            JOIN users u ON v.u_id = u.u_id
            WHERE v.u_id {in_clause} AND v.score = 1
            ORDER BY v.v_id DESC LIMIT 5
        """)).fetchall()
        
        for react in reactions:
            if react.ent_type == 'thread':
                target = db.execute(text("SELECT title, date_created, scene_id, t_id FROM threads WHERE t_id = :id"), {"id": react.ent_id}).fetchone()
                if target:
                    activities.append({
                        "id": f"like_t_{react.v_id}",
                        "user": react.username,
                        "action": "liked thread",
                        "target": target.title,
                        "time": target.date_created, 
                        "link": f"/scenes/{target.scene_id}/thread/{target.t_id}"
                    })
            elif react.ent_type == 'reply':
                target = db.execute(text("SELECT t.title, r.date_created, t.scene_id, t.t_id FROM replies r JOIN threads t ON r.thread_id = t.t_id WHERE r.rep_id = :id"), {"id": react.ent_id}).fetchone()
                if target:
                    activities.append({
                        "id": f"like_r_{react.v_id}",
                        "user": react.username,
                        "action": "liked a reply in",
                        "target": target.title,
                        "time": target.date_created, 
                        "link": f"/scenes/{target.scene_id}/thread/{target.t_id}"
                    })
                    
        # 5. Ratings
        ratings = db.execute(text(f"""
            SELECT r.rt_id, r.score, u.username, a.name as target_name, a.alb_id as target_id
            FROM ratings r
            JOIN users u ON r.u_id = u.u_id
            JOIN albums a ON r.alb_id = a.alb_id
            WHERE r.u_id {in_clause}
            ORDER BY r.rt_id DESC LIMIT 5
        """)).fetchall()
        
        for r in ratings:
            activities.append({
                "id": f"rat_{r.rt_id}",
                "user": r.username,
                "action": f"rated {r.score}/10",
                "target": r.target_name,
                "time": datetime.datetime.utcnow(),
                "link": f"/album/{r.target_id}"
            })

        activities.sort(key=lambda x: x["time"], reverse=True)
        
        def format_time_ago(dt):
            if not dt:
                return "recently"
            now = datetime.datetime.utcnow()
            if dt.tzinfo:
                dt = dt.replace(tzinfo=None)
            diff = now - dt
            seconds = diff.total_seconds()
            if seconds < 0: return "just now"
            if seconds < 60: return f"{int(seconds)}s ago"
            if seconds < 3600: return f"{int(seconds/60)}m ago"
            if seconds < 86400: return f"{int(seconds/3600)}h ago"
            return f"{int(seconds/86400)}d ago"

        for act in activities:
            act["time"] = format_time_ago(act["time"])

        return activities[:5]
    except Exception as e:
        print(f"Friend Activity Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))