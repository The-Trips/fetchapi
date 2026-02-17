from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from schemas import CreateCommunityRequest, CreateThreadRequest, CreateReplyRequest

router = APIRouter(prefix="/api", tags=["communities"])

@router.get("/communities")
def get_communities(db: Session = Depends(get_db)):
    try:
        sql = text("""
            SELECT
            s.scene_id,
            s.name,
            s.description,
            s.image_url,
            s.followers,
            u.username AS owner,
            s.official,
            s.date_created,
            COUNT(th.t_id) AS discussions
            FROM scenes s
            JOIN users u ON s.owner_id = u.u_id
            LEFT JOIN threads th ON th.scene_id = s.scene_id
            GROUP BY
            s.scene_id, s.name, s.description, s.image_url, s.followers,
            u.username, s.official, s.date_created
            ORDER BY s.followers DESC;
        """)
        results = db.execute(sql).fetchall()
        return [
            {
                "id": r.scene_id,
                "name": r.name,
                "description": r.description,
                "imageUrl": r.image_url,
                "followers": r.followers,
                "owner": r.owner,
                "isOfficial": r.official,
                "createdAt": r.date_created,
                "numDiscussions": r.discussions
            } for r in results
        ]
    except Exception as e:
        print(f"Get Communities Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/communities/{scene_id}")
def get_community_detail(scene_id: int, db: Session = Depends(get_db)):
    try:
        # Get Community Info
        scene = db.execute(text("""
        SELECT
        s.scene_id,
        s.name,
        s.description,
        s.image_url,
        s.followers,
        u.username AS owner,
        s.official,
        s.date_updated,
        s.date_created,
        COUNT(th.t_id) AS discussions
        FROM scenes s
        JOIN users u ON s.owner_id = u.u_id
        LEFT JOIN threads th ON th.scene_id = s.scene_id
        WHERE s.scene_id = :id
        GROUP BY
        s.scene_id, s.name, s.description, s.image_url, s.followers,
        u.username, s.official, s.date_created;
        """), {"id": scene_id}).fetchone()
        if not scene:
            raise HTTPException(status_code=404, detail="Community not found")
        
        # Get Threads (Discussions)
        threads_sql = text("""
            SELECT t.t_id, t.title, t.text, t.date_created, u.username, t.likes
            FROM threads t
            JOIN users u ON t.u_id = u.u_id
            WHERE t.scene_id = :id
            ORDER BY t.date_created DESC
        """)
        threads = db.execute(threads_sql, {"id": scene_id}).fetchall()

        return {
            "id": scene.scene_id,
            "name": scene.name,
            "description": scene.description,
            "imageUrl": scene.image_url,
            "owner": scene.owner,
            "isOfficial": scene.official,
            "createdAt": scene.date_created,
            "updatedAt": scene.date_updated,
            "numDiscussions": scene.discussions,
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

@router.post("/communities")
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
        return {"id": result[0], "message": "Community created"}
    except Exception as e:
        print(f"Create Community Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/threads")
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
        return {"id": result[0], "message": "Discussion started"}
    except Exception as e:
        print(f"Create Thread Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/threads/{thread_id}/replies")
def get_replies(thread_id: int, db: Session = Depends(get_db)):
    try:
        # 1. Fetch Thread Details
        thread_sql = text("""
            SELECT t.*, u.username, u.prof_pic_url
            FROM threads t
            JOIN users u ON t.u_id = u.u_id
            WHERE t.t_id = :tid
        """)
        thread_row = db.execute(thread_sql, {"tid": thread_id}).fetchone()
        
        if not thread_row:
            raise HTTPException(status_code=404, detail="Thread not found")

        # Convert thread row to dict
        thread_data = {
            "id": thread_row.t_id,
            "uid": thread_row.t_uid,
            "title": thread_row.title,
            "text": thread_row.text,
            "createdAt": str(thread_row.date_created),
            "ownerId": thread_row.u_id,
            "author": thread_row.username,
            "avatar": thread_row.prof_pic_url,
            "sceneId": thread_row.scene_id,
            "likes": thread_row.likes,
            "dislikes": thread_row.dislikes
        }

        # 2. Fetch all replies for this thread
        replies_sql = text("""
            SELECT r.rep_id, r.text, r.level, r.parent_rep_id, r.date_created, r.likes, r.dislikes, u.username, u.prof_pic_url
            FROM replies r
            JOIN users u ON r.u_id = u.u_id
            WHERE r.thread_id = :tid
            ORDER BY r.date_created ASC
        """)
        results = db.execute(replies_sql, {"tid": thread_id}).fetchall()
        
        # Create a map of all replies for easy lookup
        replies_map = {r.rep_id: {
            "id": r.rep_id,
            "text": r.text,
            "level": r.level,
            "parentId": r.parent_rep_id,
            "author": r.username,
            "avatar": r.prof_pic_url,
            "createdAt": str(r.date_created),
            "likes": r.likes,
            "dislikes": r.dislikes,
            "replies": []
        } for r in results}
        
        top_level_replies = []
        
        # Build the hierarchy
        for r_id, reply in replies_map.items():
            if reply["level"] == 1:
                top_level_replies.append(reply)
            else:
                parent_id = reply["parentId"]
                if parent_id in replies_map:
                    replies_map[parent_id]["replies"].append(reply)
        
        return {
            "thread": thread_data,
            "replies": top_level_replies
        }
    except HTTPException:
        raise
    except Exception as e:
        print(f"Get Replies Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/replies")
def create_reply(req: CreateReplyRequest, db: Session = Depends(get_db)):
    try:
        # 1. Get User ID
        user = db.execute(text("SELECT u_id FROM users WHERE username = :name"), {"name": req.username}).fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        # 2. Determine Level (Hierarchy)
        level = 1
        if req.parent_reply_id:
            parent = db.execute(text("SELECT level FROM replies WHERE rep_id = :pid"), {"pid": req.parent_reply_id}).fetchone()
            if parent:
                level = parent.level + 1

        # 3. Insert Reply
        sql = text("""
            INSERT INTO replies (text, level, thread_id, parent_rep_id, u_id, likes, dislikes, date_created)
            VALUES (:text, :level, :tid, :pid, :uid, 0, 0, NOW())
            RETURNING rep_id
        """)
        
        result = db.execute(sql, {
            "text": req.text, 
            "level": level, 
            "tid": req.thread_id, 
            "pid": req.parent_reply_id, 
            "uid": user.u_id
        }).fetchone()
        
        db.commit()
        return {"id": result[0], "message": "Reply posted"}
    except Exception as e:
        print(f"Create Reply Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))