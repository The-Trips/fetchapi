from pathlib import Path
from sqlalchemy import text
from db import engine

init_table_sql = """
create table if not exists init_status (
    id int generated always as identity primary key,
    init_key text unique not null,
    date_created timestamp not null default now()
);
"""


def init_db(parent_dir: str, order_files: list[str], init_key="v1"):
    base = Path(parent_dir)

    if not base.exists() or not base.is_dir():
        raise FileNotFoundError(f"SQL directory not found: {base.resolve()}")

    if not order_files:
        raise ValueError("order_files is empty")

    files = [base / name for name in order_files]
    missing = [f for f in files if not f.exists()]
    if missing:
        raise FileNotFoundError(
            "missing files: " +
            ", ".join(str(m) for m in missing))

    with engine.begin() as conn:

        conn.execute(text(init_table_sql))

        init_check = conn.execute(
            text("SELECT 1 FROM init_status WHERE init_key = :k LIMIT 1"),
            {"k": init_key},
            ).fetchone()

        if init_check is not None:
            print("DB was already initialised")
            return

        print("DB is being initialized")
        print(f"Running SQL queries from {base}")

        for f in files:
            print(f"running {f.name}")
            sql = f.read_text(encoding="utf-8").strip()
            if not sql:
                print(f"    skipped empty file {f}")
                continue
            conn.execute(text(sql))

        conn.execute(
            text("INSERT INTO init_status (init_key) VALUES (:k)"),
            {"k": init_key}
            )

        print("Database initialized!")
