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

# --- COMMUNITY MODELS ---
class CreateCommunityRequest(BaseModel):
    name: str
    description: str
    image_url: Optional[str] = None
    username: str

class CreateThreadRequest(BaseModel):
    title: str
    text: str
    username: str
    community_id: int

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
