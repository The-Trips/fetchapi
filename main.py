import os
from dotenv import load_dotenv
import uvicorn
from init_db import init_db

load_dotenv()
base_dir = os.getenv("SQL_BASE_FILE")
files_list = os.getenv("SQL_FILE_ORDER").split(",")


if __name__ == "__main__":

    init_db(base_dir, [p.strip() for p in files_list])
    print("Starting our app...")
    uvicorn.run("app:app", host="127.0.0.1", port=8000, reload=True, workers=2)
