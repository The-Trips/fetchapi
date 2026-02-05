
import json
import uuid
import re

import sys

INPUT_FILE = "billboard_artists_data.json"
if len(sys.argv) > 1:
    INPUT_FILE = sys.argv[1]

OUTPUT_FILE = "insert_data.sql"


def clean_sql_string(s):
    if s is None:
        return 'NULL'
    # Escape single quotes
    return "'" + str(s).replace("'", "''") + "'"


def slugify(text):
    if not text:
        return 'unknown'
    # Simple slugifycation
    text = text.lower()
    text = re.sub(r'\s+', '-', text)
    text = re.sub(r'[^a-z0-9\-]', '', text)
    return text


def generate_sql():
    try:
        with open(INPUT_FILE, 'r') as f:
            data = json.load(f)
    except FileNotFoundError:
        print(f"File {INPUT_FILE} not found. Please run scraper.py first.")
        return

    with open(OUTPUT_FILE, 'w') as f:
        f.write(
            "-- SQL Insert Script generated from Billboard/MusicBrainz data\n"
            )

        # We use a DO block for each artist to manage variables scope and IDs
        # This prevents one huge transaction and allows partial success
        # in case we split them (though here we split by blocks)

        for artist in data:
            name = clean_sql_string(artist.get('name'))
            desc = clean_sql_string(artist.get('description'))
            img_url = clean_sql_string(artist.get('profile_image_url'))
            art_type = clean_sql_string(artist.get('type'))
            hometown = clean_sql_string(artist.get('hometown'))

            socials = artist.get('social_media', {})
            spotify = clean_sql_string(socials.get('spotify'))
            apple = clean_sql_string(socials.get('apple_music'))
            insta = clean_sql_string(socials.get('instagram'))

            # Start Block
            f.write("DO $$\n")
            f.write("DECLARE\n")
            f.write("    v_art_id bigint;\n")
            f.write("    v_alb_id bigint;\n")
            f.write("    v_gen_id bigint;\n")
            f.write("BEGIN\n")

# Insert Artist
# Assuming schema: art_uid, name, desc, img_url, spotify_url, apple_url,
# insta_url, home_town, type, scene_id
# We use gen_random_uuid() for uid if valid in this Postgres version,
# else we generate in Python.
# User asked for helper functions for UUIDs
# Let's generate UUID in Python to be safe/consistent?
# Creating UUID in Python:
            art_uuid = f"'{str(uuid.uuid4())}'"

            f.write(f"    -- Insert Artist: {artist.get('name')}\n")
            f.write("    INSERT INTO artists (art_uid, name, description,\n")
            f.write("        img_url, spotify_url, apple_url, insta_url,\n")
            f.write("        home_town, type)\n")
            f.write(
                f"   VALUES ({art_uuid}, {name}, {desc}, {img_url}, {spotify},"
                f"{apple}, {insta}, {hometown}, {art_type})\n"
            )
            f.write("    RETURNING art_id INTO v_art_id;\n\n")

            # Artist Genres
            # Map genres
            unique_genres = set()
            if artist.get('primary_genres'):
                for g in artist.get('primary_genres'):
                    unique_genres.add(slugify(g))

            if unique_genres:
                f.write("    -- Artist Genres\n")
                for gen_slug in unique_genres:
                    # Insert genre if not exists
                    # Note: We rely on 'name' being unique for ON CONFLICT
                    clean_slug = clean_sql_string(gen_slug)

                    # We try to find it. If not found, insert.
                    # Robust logic: INSERT->ON CONFLICT DO NOTHING; then SELECT
                    f.write("    INSERT INTO genres (name) VALUES (")
                    f.write(f"{clean_slug}) ")
                    f.write("ON CONFLICT (name) DO NOTHING;\n")
                    f.write(
                        f"    SELECT gen_id INTO v_gen_id "
                        f"FROM genres WHERE name = {clean_slug};\n"
                    )

                    # Insert into bridge
                    # Check if v_gen_id is not null (create new if not)
                    f.write("    IF v_gen_id IS NOT NULL THEN\n")
                    f.write("        INSERT INTO artists_x_genres (\n")
                    f.write("            art_id, gen_id\n")
                    f.write("        ) VALUES (\n")
                    f.write("            v_art_id, v_gen_id\n")
                    f.write("        ) ON CONFLICT DO NOTHING;\n")
                    f.write("    END IF;\n")

            f.write("\n")

            # Albums
            albums = artist.get('albums', [])
            for album in albums:
                alb_name = clean_sql_string(album.get('title'))
                alb_desc = clean_sql_string(album.get('description'))
                cover = clean_sql_string(album.get('cover_url'))
                duration = album.get('duration', 0)  # int
                n_songs = album.get('track_count', 0)  # int
                rel_date = clean_sql_string(album.get('release_date'))
                # Check format YYYY-MM-DD? MB gives YYYY-MM-DD usually.
                # If date is 'Unknown' or incomplete -> might fail
                # Helper to fix date or set specific default.
                rdate_val = album.get('release_date')
                if not rdate_val or rdate_val == 'Unknown':
                    rel_date = 'NULL'
                elif len(rdate_val) == 4:  # YYYY
                    rel_date = f"'{rdate_val}-01-01'"
                elif len(rdate_val) == 7:  # YYYY-MM
                    rel_date = f"'{rdate_val}-01'"

                lang = clean_sql_string(album.get('primary_language'))
                alb_uuid = f"'{str(uuid.uuid4())}'"

                f.write(f"    -- Album: {album.get('title')}\n")
                f.write("    INSERT INTO albums (\n")
                f.write("        alb_uid, name, description, cover_url,\n")
                f.write("        duration, n_of_songs, rel_date, prim_lang\n")
                f.write("    )\n")
                f.write("    VALUES (\n")
                f.write(f"        {alb_uuid}, {alb_name},\n")
                f.write(f"        {alb_desc}, {cover},\n")
                f.write(f"        {duration}, {n_songs}, {rel_date},{lang})\n")
                f.write("    RETURNING alb_id INTO v_alb_id;\n")

                # Bridge: Artist x Album
                f.write("    INSERT INTO artists_x_albums (\n")
                f.write("        art_id, alb_id\n")
                f.write("    ) VALUES (\n")
                f.write("        v_art_id, v_alb_id\n")
                f.write("    );\n")

                # Album Genres
                # Check specific album genres or fallback?
                # MB release groups tags?
                # Assuming 'genres' list in album dict
                alb_genres = set()
                if album.get('genres'):
                    for g in album.get('genres'):
                        alb_genres.add(slugify(g))

                if alb_genres:
                    for gen_slug in alb_genres:
                        clean_slug = clean_sql_string(gen_slug)
                        f.write("    INSERT INTO genres (name) VALUES (")
                        f.write(f"{clean_slug}) ")
                        f.write("ON CONFLICT (name) DO NOTHING;\n")
                        f.write(
                            f"    SELECT gen_id INTO v_gen_id "
                            f"FROM genres WHERE name = {clean_slug};\n"
                        )
                        f.write("    IF v_gen_id IS NOT NULL THEN\n")
                        f.write("        INSERT INTO albums_x_genres (\n")
                        f.write("            alb_id, gen_id\n")
                        f.write("        ) VALUES (\n")
                        f.write("            v_alb_id, v_gen_id\n")
                        f.write("        ) ON CONFLICT DO NOTHING;\n")
                        f.write("    END IF;\n")

                f.write("\n")

            f.write("END $$;\n\n")

    print(f"Generated SQL to {OUTPUT_FILE}")


if __name__ == "__main__":
    generate_sql()
