import os
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

load_dotenv()
engine = create_engine(os.getenv("DATABASE_URL"))

with engine.connect() as conn:
    print("Making scenes.owner_id nullable...")
    alter_sql = text("ALTER TABLE scenes ALTER COLUMN owner_id DROP NOT NULL;")
    conn.execute(alter_sql)
    conn.commit()
    print("Owner ID is now nullable.")
