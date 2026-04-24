import secrets
import string
from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session
from db import get_db
from schemas import (
    RegisterRequest, 
    VerifyRequest, 
    CreateUserRequest, 
    LoginRequest,
    ForgotPasswordRequest,
    VerifyResetCodeRequest,
    UpdatePasswordRequest
)

router = APIRouter(prefix="/api", tags=["auth"])

def generate_token(length=6):
    alphabet = string.ascii_uppercase + string.digits
    return ''.join(secrets.choice(alphabet) for _ in range(length))

def send_verification_email(email: str, token: str):
    # This is a mock function. In a real app, you would use an email service like Resend, SendGrid, or FastAPI-Mail.
    print(f"--- EMAIL SENT TO {email} ---")
    print(f"Your verification code is: {token}")
    print("------------------------------")

@router.post("/register")
def register(req: RegisterRequest, db: Session = Depends(get_db)):
    try:
        # Check if email already in use
        check_email = db.execute(
            text("SELECT u_id FROM priv_users WHERE email = :email"),
            {"email": req.email}).fetchone()
        if check_email:
            raise HTTPException(status_code=400, detail="Email already registered")

        # Check if username already in use
        check_username = db.execute(
            text("SELECT u_id FROM users WHERE username = :username"),
            {"username": req.username}).fetchone()
        if check_username:
            raise HTTPException(status_code=400, detail="Username already taken")

        token = generate_token()
        
        # Save to pending_registrations (overwrite if already exists for this email)
        sql = text("""
            INSERT INTO pending_registrations (email, full_name, username, password, token)
            VALUES (:email, :name, :username, :pw, :token)
            ON CONFLICT (email) DO UPDATE SET
                full_name = EXCLUDED.full_name,
                username = EXCLUDED.username,
                password = EXCLUDED.password,
                token = EXCLUDED.token,
                created_at = NOW()
        """)
        db.execute(sql, {
            "email": req.email, 
            "name": req.name, 
            "username": req.username, 
            "pw": req.password, 
            "token": token
        })
        db.commit()

        # Send email (mock)
        send_verification_email(req.email, token)

        return {"message": "Verification code sent to email"}
    except HTTPException:
        raise
    except Exception as e:
        print(f"Register Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/verify")
def verify(req: VerifyRequest, db: Session = Depends(get_db)):
    try:
        # Check token
        pending = db.execute(
            text("SELECT * FROM pending_registrations WHERE email = :email AND token = :token"),
            {"email": req.email, "token": req.token}).fetchone()
        
        if not pending:
            raise HTTPException(status_code=400, detail="Invalid or expired token")

        # 1. Insert into priv_users
        sql_priv = text("""
            INSERT INTO priv_users (email, hash_pw, role, date_created, last_login, privacy_st, is_silenced, is_verified)
            VALUES (:email, :pw, 'user', NOW(), NOW(), 200, false, true)
            RETURNING u_id
        """)
        result = db.execute(sql_priv, {"email": pending.email, "pw": pending.password})
        u_id = result.fetchone()[0]

        # 2. Insert into users
        sql_user = text("""
            INSERT INTO users (u_id, username, full_name, bio, prof_pic_url)
            VALUES (:uid, :uname, :fname, 'Music enthusiast.', 'https://placehold.co/150')
        """)
        db.execute(sql_user, {
            "uid": u_id, 
            "uname": pending.username, 
            "fname": pending.full_name
        })

        # 3. Clean up pending_registrations
        db.execute(text("DELETE FROM pending_registrations WHERE email = :email"), {"email": pending.email})
        
        db.commit()
        return {"message": "Verification successful. Account created.", "username": pending.username}
    except HTTPException:
        raise
    except Exception as e:
        print(f"Verify Error: {e}")
        db.rollback()
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

@router.post("/forgot-password")
def forgot_password(req: ForgotPasswordRequest, db: Session = Depends(get_db)):
    try:
        # 1. Check if user exists
        user = db.execute(
            text("SELECT email FROM priv_users WHERE email = :email"),
            {"email": req.email}
        ).fetchone()
        
        if not user:
            # For security, you might want to return 200 anyway to prevent account enumeration,
            # but for this app, we'll keep it simple.
            raise HTTPException(status_code=404, detail="Email not found")

        # 2. Generate token
        token = generate_token()

        # 3. Save to password_resets
        db.execute(
            text("""
                INSERT INTO password_resets (email, token)
                VALUES (:email, :token)
                ON CONFLICT (email) DO UPDATE SET
                    token = EXCLUDED.token,
                    created_at = NOW()
            """),
            {"email": req.email, "token": token}
        )
        db.commit()

        # 4. Print to logs (Mock email)
        print(f"--- PASSWORD RESET EMAIL SENT TO {req.email} ---")
        print(f"Your reset code is: {token}")
        print("-----------------------------------------------")

        return {"message": "Reset code sent to email"}
    except HTTPException:
        raise
    except Exception as e:
        print(f"Forgot Password Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/verify-reset-code")
def verify_reset_code(req: VerifyResetCodeRequest, db: Session = Depends(get_db)):
    try:
        # Check if token matches
        reset_entry = db.execute(
            text("SELECT * FROM password_resets WHERE email = :email AND token = :token"),
            {"email": req.email, "token": req.token}
        ).fetchone()
        
        if not reset_entry:
            raise HTTPException(status_code=400, detail="Invalid or expired reset code")
        
        return {"message": "Code verified"}
    except HTTPException:
        raise
    except Exception as e:
        print(f"Verify Reset Code Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/update-password")
def update_password(req: UpdatePasswordRequest, db: Session = Depends(get_db)):
    try:
        # 1. Re-verify token (for safety)
        reset_entry = db.execute(
            text("SELECT * FROM password_resets WHERE email = :email AND token = :token"),
            {"email": req.email, "token": req.token}
        ).fetchone()
        
        if not reset_entry:
            raise HTTPException(status_code=400, detail="Unauthorized password update")

        # 2. Update password in priv_users
        db.execute(
            text("UPDATE priv_users SET hash_pw = :pw WHERE email = :email"),
            {"pw": req.new_password, "email": req.email}
        )
        
        # 3. Clean up reset token
        db.execute(
            text("DELETE FROM password_resets WHERE email = :email"),
            {"email": req.email}
        )
        
        db.commit()
        return {"message": "Password updated successfully"}
    except HTTPException:
        raise
    except Exception as e:
        print(f"Update Password Error: {e}")
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
