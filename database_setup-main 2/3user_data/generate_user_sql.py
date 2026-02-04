import sys
import csv
from pathlib import Path
sys.path.append(str(Path(__file__).resolve().parents[1]))

from helpers import as_nullable_text, as_nullable_bool

"""
Generate import_user_data.sql from a CSV seed file.
The CSV should have these headers:
  id, email,hash_pw,role,date_created,last_login,privacy_st,
  is_silenced,username,bio,prof_pic_url
Run command: python3 generate_user_sql.py user_seed.csv insert_userdata.sql
"""


def main():
    if len(sys.argv) != 3:
        print("Usage: python3 generate_user_sql.py <input_csv> <output_sql>")
        sys.exit(1)

    input_csv = sys.argv[1]
    output_sql = sys.argv[2]

    with open(input_csv, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    lines = []
    lines.append("-- Auto-generated from " + input_csv)
    lines.append("BEGIN;")
    lines.append("")

    lines.append("-- Insert into priv_users first")
    for r in rows:
        u_id = (r.get("id", "") or "").strip()
        if not u_id.isdigit():
            raise ValueError(f"id must be an int, got: {u_id}")
        email = as_nullable_text(r.get("email", ""))
        hash_pw = as_nullable_text(r.get("hash_pw", ""))
        role = as_nullable_text(r.get("role", ""))
        date_created = as_nullable_text(r.get("date_created", ""))
        last_login = as_nullable_text(r.get("last_login", ""))
        privacy_st = (r.get("privacy_st", "") or "").strip()
        is_silenced = as_nullable_bool(r.get("is_silenced", ""))

        if not privacy_st.isdigit():
            raise ValueError(f"privacy_st must be an int, got: {privacy_st}")

        lines.append(
            "INSERT INTO priv_users (u_id, email, hash_pw, role, date_created,"
            "last_login, privacy_st, is_silenced) "
            f"VALUES ({u_id}, {email}, {hash_pw}, {role}, {date_created}, "
            f"{last_login}, {privacy_st}, {is_silenced}) "
            "ON CONFLICT (u_id) DO UPDATE SET email=EXCLUDED.email, "
            "hash_pw=EXCLUDED.hash_pw, role=EXCLUDED.role, "
            "last_login=EXCLUDED.last_login, "
            "privacy_st=EXCLUDED.privacy_st, is_silenced=EXCLUDED.is_silenced;"
        )

    lines.append("")
    lines.append("-- Insert into users using u_id looked up by email")
    lines.append("-- (1-1 with priv_users)")
    for r in rows:
        u_id = (r.get("id", "") or "").strip()
        if not u_id.isdigit():
            raise ValueError(f"id must be an int, got: {u_id}")

        username = as_nullable_text(r.get("username", ""))
        bio = as_nullable_text(r.get("bio", ""))
        prof_pic_url = as_nullable_text(r.get("prof_pic_url", ""))

        lines.append(
            "INSERT INTO users (u_id, username, bio, prof_pic_url) "
            f"VALUES ({u_id}, {username}, {bio}, {prof_pic_url}) "
            "ON CONFLICT (u_id) DO UPDATE SET "
            "username=EXCLUDED.username, bio=EXCLUDED.bio, "
            "prof_pic_url=EXCLUDED.prof_pic_url;"
        )

    lines.append("")
    lines.append("COMMIT;")

    with open(output_sql, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

    print(f"Wrote {output_sql} with {len(rows)} users.")


if __name__ == "__main__":
    main()
