# Helper functions that assist other scripts fro csv conversion
import datetime


def sql_quote(val: str) -> str:
    # Basic SQL string escaping for single quotes
    return val.replace("'", "''")


def as_nullable_text(val: str):
    if val is None or val == "":
        return "NULL"
    return "'" + sql_quote(val) + "'"


def as_nullable_bool(val: str):
    if val is None or val == "":
        return "NULL"
    v = val.strip().lower()
    if v in ("true", "t", "1", "yes", "y"):
        return "TRUE"
    if v in ("false", "f", "0", "no", "n"):
        return "FALSE"
    raise ValueError(f"Invalid boolean: {val}")


def parse_dt(val: str) -> str:
    """Parse M/D/YY HH:MM -> YYYY-MM-DD HH:MM:SS"""
    if val is None or val.strip() == "":
        raise ValueError("date_created/last_login cannot be empty")
    dt = datetime.strptime(val.strip(), "%m/%d/%y %H:%M")
    return dt.strftime("%Y-%m-%d %H:%M:%S")
