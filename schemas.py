from pydantic import BaseModel
from typing import Optional, List

# --- AUTH MODELS ---
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

# --- SCENE MODELS ---
class CreateSceneRequest(BaseModel):
    name: str
    description: str
    image_url: Optional[str] = None
    username: str

class CreateThreadRequest(BaseModel):
    title: str
    text: str
    username: str
    scene_id: int
  
class CreateReplyRequest(BaseModel):
    username: str
    thread_id: int
    text: str
    parent_reply_id: Optional[int] = None
# --- ALBUM & REVIEW MODELS ---
class ReviewRequest(BaseModel):
    album_id: int
    rating: int
    text: str
    username: str

class MoodRequest(BaseModel):
    album_id: int
    mood_id: int
    username: str

# --- USER MODELS ---
class UserProfileUpdate(BaseModel):
    bio: Optional[str] = None
    prof_pic_url: Optional[str] = None
    insta_url: Optional[str] = None
    twitter_url: Optional[str] = None
    website_url: Optional[str] = None
    is_private: Optional[bool] = None          
    has_unread_followers: Optional[bool] = None 

class JoinSceneRequest(BaseModel):
    username: str

# Add to the bottom of schemas.py
class FollowUserRequest(BaseModel):
    current_username: str

# --- LISTS MODELS ---

class CreateListRequest(BaseModel):
    username: str
    name: str

class AddToListRequest(BaseModel):
    list_id: int
    album_id: int