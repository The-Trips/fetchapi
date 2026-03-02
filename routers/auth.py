from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from schemas import RegisterRequest, CreateUserRequest, LoginRequest

router = APIRouter(prefix="/api", tags=["auth"])

@router.post("/register")
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

@router.post("/create-username")
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

@router.post("/login")
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
