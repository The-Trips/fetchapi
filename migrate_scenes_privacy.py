import os
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

load_dotenv()
engine = create_engine(os.getenv("DATABASE_URL"))

with engine.connect() as conn:
    print("Checking if privacy_status column exists in scenes table...")
    check_sql = text("""
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_name='scenes' AND column_name='privacy_status';
    """)
    result = conn.execute(check_sql).fetchone()
    
    if not result:
        print("Column does not exist. Adding privacy_status to scenes table...")
        # default to 200 (Public)
        add_sql = text("ALTER TABLE scenes ADD COLUMN privacy_status INT NOT NULL DEFAULT 200 REFERENCES privacy_status(priv_st_id);")
        conn.execute(add_sql)
        conn.commit()
        print("Column added successfully.")
    else:
        print("Column already exists.")
