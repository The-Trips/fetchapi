from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from typing import Optional

router = APIRouter(prefix="/api/notifications", tags=["notifications"])

@router.get("/count")
def get_unread_count(username: str, db: Session = Depends(get_db)):
    """Get count of unread notifications for a user"""
    try:
        # Get user ID
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": username}
        ).fetchone()
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        # Count unread notifications (is_viewed = FALSE)
        count = db.execute(
            text("""
                SELECT COUNT(*) as count 
                FROM notifications 
                WHERE user_id = :user_id AND is_viewed = FALSE
            """),
            {"user_id": user.u_id}
        ).fetchone()
        
        return {"count": count.count if count else 0}
    
    except HTTPException:
        raise
    except Exception as e:
        print(f"Error getting notification count: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.get("")
def get_notifications(username: str, limit: int = 50, db: Session = Depends(get_db)):
    """Get all notifications for a user, grouped by type"""
    try:
        # Get user ID
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": username}
        ).fetchone()
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        # Get notifications with entity details
        notifications_sql = text("""
            SELECT 
                n.noti_id,
                n.user_id,
                n.ou_id as actor_id,
                n.ent_id,
                n.ent_type,
                n.is_viewed,
                n.date_created,
                actor.username as actor_username,
                actor.prof_pic_url as actor_avatar
            FROM notifications n
            LEFT JOIN users actor ON n.ou_id = actor.u_id
            WHERE n.user_id = :user_id
            ORDER BY n.date_created DESC
            LIMIT :limit
        """)
        
        results = db.execute(
            notifications_sql, 
            {"user_id": user.u_id, "limit": limit}
        ).fetchall()
        
        # Group notifications by type
        grouped = {
            "follows": [],
            "replies": [],
            "mentions": [],
            "scene_activity": [],
            "other": []
        }
        
        for row in results:
            # Build message based on entity type
            message = ""
            thread_id = None
            reply_id = None
            scene_id = None
            
            if row.ent_type == "follow":
                message = f"{row.actor_username} started following you"
            elif row.ent_type == "reply":
                message = f"{row.actor_username} replied to your comment"
                reply_id = row.ent_id
                # Get thread_id AND scene_id from reply
                thread_info = db.execute(
                    text("""
                        SELECT r.thread_id, t.scene_id 
                        FROM replies r 
                        JOIN threads t ON r.thread_id = t.t_id 
                        WHERE r.rep_id = :rep_id
                    """),
                    {"rep_id": row.ent_id}
                ).fetchone()
                if thread_info:
                    thread_id = thread_info.thread_id
                    scene_id = thread_info.scene_id
            elif row.ent_type == "mention":
                message = f"{row.actor_username} mentioned you in a discussion"
                reply_id = row.ent_id
                # Get thread_id AND scene_id from reply
                thread_info = db.execute(
                    text("""
                        SELECT r.thread_id, t.scene_id 
                        FROM replies r 
                        JOIN threads t ON r.thread_id = t.t_id 
                        WHERE r.rep_id = :rep_id
                    """),
                    {"rep_id": row.ent_id}
                ).fetchone()
                if thread_info:
                    thread_id = thread_info.thread_id
                    scene_id = thread_info.scene_id
            elif row.ent_type == "thread":
                message = f"{row.actor_username} created a new discussion"
                thread_id = row.ent_id
                # Get scene_id from thread
                thread_info = db.execute(
                    text("SELECT scene_id FROM threads WHERE t_id = :t_id"),
                    {"t_id": row.ent_id}
                ).fetchone()
                if thread_info:
                    scene_id = thread_info.scene_id
            elif row.ent_type == "scene":
                message = f"{row.actor_username} joined your community"
                scene_id = row.ent_id
            else:
                message = f"New activity from {row.actor_username}"
            
            notif = {
                "id": row.noti_id,
                "type": row.ent_type,
                "message": message,
                "isRead": row.is_viewed,
                "createdAt": row.date_created.isoformat() if row.date_created else None,
                "actor": {
                    "username": row.actor_username,
                    "avatar": row.actor_avatar
                } if row.actor_username else None,
                "threadId": thread_id,
                "replyId": reply_id,
                "sceneId": scene_id
            }
            
            # Categorize into groups
            if row.ent_type == "follow":
                grouped["follows"].append(notif)
            elif row.ent_type in ["reply", "mention"]:
                grouped["replies"].append(notif)
            elif row.ent_type in ["thread", "scene"]:
                grouped["scene_activity"].append(notif)
            else:
                grouped["other"].append(notif)
        
        return grouped
    
    except HTTPException:
        raise
    except Exception as e:
        print(f"Error getting notifications: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/mark-read")
def mark_notification_read(notif_id: int, db: Session = Depends(get_db)):
    """Mark a single notification as read"""
    try:
        db.execute(
            text("""
                UPDATE notifications 
                SET is_viewed = TRUE
                WHERE noti_id = :notif_id
            """),
            {"notif_id": notif_id}
        )
        db.commit()
        return {"message": "Notification marked as read"}
    
    except Exception as e:
        db.rollback()
        print(f"Error marking notification read: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/mark-all-read")
def mark_all_read(username: str, db: Session = Depends(get_db)):
    """Mark all notifications as read for a user"""
    try:
        # Get user ID
        user = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": username}
        ).fetchone()
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        db.execute(
            text("""
                UPDATE notifications 
                SET is_viewed = TRUE
                WHERE user_id = :user_id AND is_viewed = FALSE
            """),
            {"user_id": user.u_id}
        )
        db.commit()
        return {"message": "All notifications marked as read"}
    
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        print(f"Error marking all notifications read: {e}")
        raise HTTPException(status_code=500, detail=str(e))


# --- Helper function to create notifications (use in other routers) ---
def create_notification(
    db: Session,
    recipient_id: int,
    actor_id: int,
    entity_id: int,
    entity_type: str
):
    """
    Helper function to create a notification using existing schema
    
    Args:
        recipient_id: User receiving the notification (user_id)
        actor_id: User who triggered the notification (ou_id)
        entity_id: ID of the related entity (ent_id) - thread_id, reply_id, scene_id, etc.
        entity_type: Type of entity (ent_type) - 'follow', 'reply', 'mention', 'thread', 'scene'
    """
    try:
        sql = text("""
            INSERT INTO notifications 
            (user_id, ou_id, ent_id, ent_type, is_viewed, date_created)
            VALUES (:user_id, :ou_id, :ent_id, :ent_type, FALSE, NOW())
            RETURNING noti_id
        """)
        
        result = db.execute(sql, {
            "user_id": recipient_id,
            "ou_id": actor_id,
            "ent_id": entity_id,
            "ent_type": entity_type
        }).fetchone()
        
        db.commit()
        return result.noti_id if result else None
    
    except Exception as e:
        db.rollback()
        print(f"Error creating notification: {e}")
        return None