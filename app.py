# fetchapi/app.py

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import auth, communities, albums, users

app = FastAPI(title="Album API", description="Backend for Album Discovery App")

# Enable React Frontend to talk to Python Backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173", 
        "http://localhost:5174",
        "http://localhost:5175", 
        "http://localhost:3000",
        "http://localhost:8000"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# --- Include Routers ---
app.include_router(auth.router)
app.include_router(communities.router)
app.include_router(albums.router)
app.include_router(users.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to the Album API"}