-- SQL Insert Script generated from Billboard/MusicBrainz data
DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: ENHYPEN
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('0608f78d-0048-4d26-9bb7-17a904abebf6', 'ENHYPEN', '', 'https://placehold.co/400?text=ENHYPEN', 'https://open.spotify.com/artist/5t5FqBwTcgKTaWmfEbwQY9','https://music.apple.com/jp/artist/1541011620', 'https://www.instagram.com/enhypen/', 'Seoul', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Dimension: Dilemma
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '64fd4430-e7d3-4744-b820-f618be1934f4', 'Dimension: Dilemma',
        'Album', 'http://coverartarchive.org/release-group/0b688c36-d63f-409e-ae68-0b99373d074e/front',
        1334, 8, '2021-10-12','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: 定め
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '591866b3-d18f-4ea8-a0f8-a035f576b96b', '定め',
        'Album', 'http://coverartarchive.org/release-group/971331ab-419a-45de-93e4-bdae99aa6796/front',
        1698, 9, '2022-10-25','mul')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: ROMANCE : UNTOLD
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8cc05fc3-dd2f-4878-9e42-4cd8ea2b5d93', 'ROMANCE : UNTOLD',
        'Album', 'http://coverartarchive.org/release-group/0c668bdb-328c-4dba-8407-8eddb5373a5d/front',
        1619, 9, '2024-07-12','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Bad Bunny
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('69ab7f95-3c45-4582-9774-1371d32538af', 'Bad Bunny', 'Cantante y compositor', 'https://placehold.co/400?text=Bad%20Bunny', 'https://open.spotify.com/artist/4q3ewBCX7sLwd24euuV69X','https://music.apple.com/us/artist/1126808565', 'https://www.instagram.com/badbunnypr/', 'San Juan', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('trap-latino') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-latino';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin-trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin-trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggaeton') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggaeton';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: X 100PRE
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'a505e898-dded-4708-9280-35e29ae3f603', 'X 100PRE',
        'Album', 'http://coverartarchive.org/release-group/68f8c63d-3e54-4f26-8ce3-41a7bc1ca7fd/front',
        3236, 15, '2018-12-24','spa')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('trap-latino') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-latino';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin-trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin-trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggaeton') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggaeton';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: OASIS
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'e1ee81cc-fa94-4e9d-b18b-f9a8e4940bac', 'OASIS',
        'Album', 'http://coverartarchive.org/release-group/54976c04-e3f9-4eac-a8b2-b88d87d7f0e6/front',
        1866, 8, '2019-06-28','spa')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('trap-latino') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-latino';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin-trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin-trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggaeton') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggaeton';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: YHLQMDLG
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'dc359d05-cb69-4225-a691-2e4fbcf0fe75', 'YHLQMDLG',
        'Album', 'http://coverartarchive.org/release-group/e20e0bc0-4660-461b-8ac7-14ad2459cda6/front',
        3958, 20, '2020-02-29','spa')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('trap-latino') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-latino';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin-trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin-trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggaeton') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggaeton';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: LAS QUE NO IBAN A SALIR
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '4655aad8-275f-416b-a1e9-2f5b50c52596', 'LAS QUE NO IBAN A SALIR',
        'Album', 'http://coverartarchive.org/release-group/1591a80c-7aae-426e-8ec7-164f24ac3e1f/front',
        1819, 10, '2020-05-10','spa')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('trap-latino') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-latino';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin-trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin-trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggaeton') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggaeton';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: EL ÚLTIMO TOUR DEL MUNDO
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f3046634-b45a-4486-9a32-98121a0ad059', 'EL ÚLTIMO TOUR DEL MUNDO',
        'Album', 'http://coverartarchive.org/release-group/4b550700-6912-4f3b-a804-bac8da786629/front',
        2839, 16, '2020-11-27','spa')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('trap-latino') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-latino';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin-trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin-trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('latin') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'latin';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggaeton') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggaeton';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: A$AP Rocky
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('9e021b02-c5f7-44f5-859e-0b9721f45970', 'A$AP Rocky', 'US rapper', 'https://placehold.co/400?text=A%24AP%20Rocky', 'https://open.spotify.com/artist/13ubrt8QOOCPljQ2FL1Kca','https://music.apple.com/us/artist/481488005', 'https://www.instagram.com/asaprocky/', 'Harlem', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: LONG.LIVE.A$AP
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0b832951-8c94-4644-a51e-d656cb3a9f33', 'LONG.LIVE.A$AP',
        'Album', 'http://coverartarchive.org/release-group/c0eb54b5-757a-452a-a248-d7dbdb39cd18/front',
        3902, 16, '2013-01-11','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: AT.LONG.LAST.A$AP
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'a86cfbeb-304c-4c1f-b332-cbecb8de3680', 'AT.LONG.LAST.A$AP',
        'Album', 'http://coverartarchive.org/release-group/10a526a7-9d24-463f-8c0b-16ac98027460/front',
        3971, 18, '2015-05-26','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: TESTING
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2a2251ee-9957-46fa-9436-5a72fc4b12f7', 'TESTING',
        'Album', 'http://coverartarchive.org/release-group/a82cafe6-d3df-4d76-be85-60a757ad2687/front',
        3136, 15, '2018-05-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Don't Be Dumb (with features)
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'cc7952d9-0074-48db-a773-b2d04f047b84', 'Don''t Be Dumb (with features)',
        'Album', 'http://coverartarchive.org/release-group/b6200075-9a83-4128-bfac-9d2394570f2b/front',
        1647, 17, '2026-01-16','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Don’t Be Dumb
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c1e900b8-4e86-423f-80f5-cc647a1a97e8', 'Don’t Be Dumb',
        'Album', 'http://coverartarchive.org/release-group/132f6b97-eb7b-44d4-9b34-97014e1e9039/front',
        3584, 17, '2026-01-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Morgan Wallen
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('505346f4-df79-4aa1-bdee-8eb6043b4147', 'Morgan Wallen', 'country music singer', 'https://placehold.co/400?text=Morgan%20Wallen', 'https://open.spotify.com/artist/4oUHIQIBe0LHzYfvXNW4QM','https://music.apple.com/us/artist/829142092', 'https://www.instagram.com/morganwallen/', 'Sneedville', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: If I Know Me
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9a2d33d7-29c4-4c46-b89e-8c4de0aeecbd', 'If I Know Me',
        'Album', 'http://coverartarchive.org/release-group/5b5816e5-54a9-49c1-ad3a-cd6161d18436/front',
        2710, 14, '2018-04-27','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Dangerous: The Double Album
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c7fb4aca-2ce7-43b8-9c00-d148d4accf2e', 'Dangerous: The Double Album',
        'Album', 'http://coverartarchive.org/release-group/c61d61b6-9850-4b59-bb73-0cde95ab7b75/front',
        5827, 30, '2021-01-08','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: One Thing at a Time
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '64fca21a-f509-4301-a919-afea5072cdaf', 'One Thing at a Time',
        'Album', 'http://coverartarchive.org/release-group/eab1ce83-eb3d-4e70-94ff-6fddd5405e84/front',
        6722, 36, '2023-03-03','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: I’m the Problem
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2c6343d2-c32d-4fa1-a84a-c6d549987fc9', 'I’m the Problem',
        'Album', 'http://coverartarchive.org/release-group/ccd3238f-1db1-4349-90f3-6941a259f2c1/front',
        7048, 37, '2025-05-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Taylor Swift
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('eea4291d-2178-4fc6-9ae2-eced74db99e9', 'Taylor Swift', '', 'https://placehold.co/400?text=Taylor%20Swift', 'https://open.spotify.com/artist/06HL4z0CvFAxyc27GXpf02','https://music.apple.com/us/artist/159260351', 'https://www.instagram.com/taylorswift/', 'West Reading', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('re-recording') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 're-recording';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('artist-of-the-decade') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'artist-of-the-decade';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('list') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'list';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-folk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-folk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nuno') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nuno';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singersongwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singersongwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Taylor Swift
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2bac42e3-fe3e-4105-bfa1-d4a41e633fca', 'Taylor Swift',
        'Album', 'http://coverartarchive.org/release-group/ba1d0c2a-bb07-38bc-835c-a880f76f1309/front',
        2410, 11, '2006-10-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('re-recording') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 're-recording';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('artist-of-the-decade') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'artist-of-the-decade';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('list') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'list';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-folk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-folk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nuno') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nuno';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singersongwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singersongwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Fearless
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '63ead37e-1426-479d-b011-174de94f83c5', 'Fearless',
        'Album', 'http://coverartarchive.org/release-group/63eba062-847c-3b73-8b0f-6baf27bba6fa/front',
        3214, 13, '2008-11-11','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('re-recording') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 're-recording';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('artist-of-the-decade') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'artist-of-the-decade';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('list') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'list';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-folk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-folk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nuno') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nuno';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singersongwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singersongwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Speak Now
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8d96db09-bec2-40a5-b4a9-282c7ff4f1b9', 'Speak Now',
        'Album', 'http://coverartarchive.org/release-group/ba1259eb-d41e-41c5-a70c-0e6fa73e6708/front',
        6079, 22, '2010-10-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('re-recording') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 're-recording';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('artist-of-the-decade') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'artist-of-the-decade';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('list') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'list';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-folk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-folk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nuno') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nuno';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singersongwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singersongwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Red
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ae8243ea-23ce-4cff-b30e-a2fbbcbb545e', 'Red',
        'Album', 'http://coverartarchive.org/release-group/a73cecde-0923-40ad-aad1-e8c24ba6c3d2/front',
        3908, 16, '2012-08-10','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('re-recording') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 're-recording';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('artist-of-the-decade') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'artist-of-the-decade';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('list') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'list';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-folk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-folk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nuno') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nuno';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singersongwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singersongwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: 1989
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '58307011-ac20-4065-b8c4-fc2732618da9', '1989',
        'Album', 'http://coverartarchive.org/release-group/4d9ec1c2-58ec-48a4-aa0a-916718adead0/front',
        4125, 19, '2014-10-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('re-recording') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 're-recording';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('artist-of-the-decade') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'artist-of-the-decade';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('list') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'list';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-folk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-folk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nuno') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nuno';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singersongwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singersongwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Bruno Mars
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('c98df4d0-79c3-48df-b6c8-b9446e26ce5b', 'Bruno Mars', 'US singer', 'https://placehold.co/400?text=Bruno%20Mars', 'https://open.spotify.com/artist/0du5cEVh5yTK9QJze8zA0C','https://music.apple.com/us/artist/278873078', 'https://www.instagram.com/brunomars/', 'Honolulu', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('relic-inn') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'relic-inn';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('funk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'funk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('music-for-soccer-moms') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'music-for-soccer-moms';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Doo-Wops & Hooligans
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f36129ca-e9fa-4207-ab10-7fd6fb987fff', 'Doo-Wops & Hooligans',
        'Album', 'http://coverartarchive.org/release-group/b3d1fbf7-dd1c-4119-a16e-58c2feb5bcb0/front',
        2124, 10, '2010-10-04','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('relic-inn') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'relic-inn';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('funk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'funk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('music-for-soccer-moms') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'music-for-soccer-moms';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Unorthodox Jukebox
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b4ea9d4e-b374-444d-8671-8a75246b8fb5', 'Unorthodox Jukebox',
        'Album', 'http://coverartarchive.org/release-group/978d88db-60ec-41d9-ade7-beea020941b0/front',
        2096, 10, '2012-12-07','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('relic-inn') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'relic-inn';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('funk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'funk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('music-for-soccer-moms') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'music-for-soccer-moms';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: 24K Magic
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd495b7c3-a959-485f-a7f9-472a87f3dc9f', '24K Magic',
        'Album', 'http://coverartarchive.org/release-group/80ea43b7-2c32-4a79-9fb0-8ff1761ebe09/front',
        2009, 9, '2016-11-17','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('relic-inn') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'relic-inn';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('funk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'funk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('music-for-soccer-moms') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'music-for-soccer-moms';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Romantic
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '884dfc50-1232-4d43-8b0d-fa9e355bf562', 'The Romantic',
        'Album', 'http://coverartarchive.org/release-group/a868464a-2e60-484b-bacd-aaeaee71284e/front',
        0, 0, '2026-02-27','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('relic-inn') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'relic-inn';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('funk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'funk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('music-for-soccer-moms') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'music-for-soccer-moms';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Zach Bryan
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('2e8d7490-7e5a-418c-9b10-fc736926990b', 'Zach Bryan', 'Canadian singer/songwriter', 'https://placehold.co/400?text=Zach%20Bryan', 'https://open.spotify.com/artist/3Z02hBLubJxuFJfhacLSDc','https://music.apple.com/us/artist/85932', 'https://www.instagram.com/bryanadams/', 'Kingston', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('aor') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aor';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('power-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'power-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-wave') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-wave';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heartland-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heartland-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('canadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'canadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Bryan Adams
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '41ed8c76-049c-4a0f-bedc-c58bae09c3d3', 'Bryan Adams',
        'Album', 'http://coverartarchive.org/release-group/c67d84d5-8032-36be-91e2-2db9af081a51/front',
        1869, 9, '1980-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('aor') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aor';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('power-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'power-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-wave') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-wave';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heartland-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heartland-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('canadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'canadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: You Want It ▪ You Got It
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f410a3e1-eecd-4eb7-90f9-bcc5cf8c3a28', 'You Want It ▪ You Got It',
        'Album', 'http://coverartarchive.org/release-group/a55ea7ed-c2af-3dd1-8093-515267896b29/front',
        2332, 10, '1981-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('aor') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aor';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('power-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'power-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-wave') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-wave';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heartland-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heartland-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('canadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'canadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cuts Like a Knife
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c7816161-57c2-407f-a3e7-42a5e9fa169f', 'Cuts Like a Knife',
        'Album', 'http://coverartarchive.org/release-group/fdec9411-dca9-3a83-b1c2-3d934a82f9be/front',
        2229, 10, '1983-01-18','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('aor') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aor';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('power-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'power-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-wave') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-wave';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heartland-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heartland-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('canadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'canadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Reckless
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2f1a88b9-44f4-40a1-a7a5-e4807b92d23a', 'Reckless',
        'Album', 'http://coverartarchive.org/release-group/fe1d2bcd-cdb6-333b-b2c6-8389e5890f04/front',
        2275, 10, '1984-10-29','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('aor') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aor';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('power-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'power-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-wave') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-wave';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heartland-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heartland-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('canadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'canadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Into the Fire
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '25b552b0-f783-4f81-8757-0a7314a44752', 'Into the Fire',
        'Album', 'http://coverartarchive.org/release-group/21708a32-5788-34fa-b43d-8e548ae6d7f8/front',
        2714, 10, '1987-03-30','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('aor') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aor';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('power-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'power-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-wave') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-wave';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heartland-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heartland-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('canadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'canadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Olivia Dean
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('23c84f85-b6f0-4c28-83f6-ee9712615922', 'Olivia Dean', 'American singer/actor', 'https://placehold.co/400?text=Olivia%20Dean', 'https://open.spotify.com/artist/49e4v89VmlDcFCMyDv9wQ9','https://music.apple.com/us/artist/266028', 'https://www.instagram.com/deanmartinofficial/', 'Steubenville', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Swingin’ Down Yonder
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '5f5ebe14-0f34-44d0-b81a-d1d455d957a2', 'Swingin’ Down Yonder',
        'Album', 'http://coverartarchive.org/release-group/d9ec03b8-b9db-3f30-8b95-787eade2a7da/front',
        1781, 12, '1955-08-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Dean Martin Sings
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'cba462f2-c38d-4eed-8ea6-973634177007', 'Dean Martin Sings',
        'Album', 'http://coverartarchive.org/release-group/b4deca76-42bf-40ed-a638-823785d0be3a/front',
        2014, 12, '1955-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Pretty Baby
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '31c6b1a2-9aef-4a1c-8f4c-748ec21c597d', 'Pretty Baby',
        'Album', 'http://coverartarchive.org/release-group/d350a6b2-80ee-4894-928f-c66603b7e6d2/front',
        1808, 12, '1957-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: A Winter Romance
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'e4a383b3-5fa5-4128-833e-b9d31c7ef737', 'A Winter Romance',
        'Album', 'http://coverartarchive.org/release-group/e4e74204-ff9b-3136-9284-1c138613c355/front',
        1953, 12, '1959-11-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Sleep Warm
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0517237c-c24d-4ed9-a7d1-312b7ef234ff', 'Sleep Warm',
        'Album', 'http://coverartarchive.org/release-group/8be5a50f-90ed-3a18-93a7-746f5dda34ad/front',
        2226, 12, '1959-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Luke Combs
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('605bb9e0-8a6a-4b89-8f00-adfe9f1b36cb', 'Luke Combs', 'country music singer', 'https://placehold.co/400?text=Luke%20Combs', 'https://open.spotify.com/artist/718COspgdWOnwOFpJHRZHS','https://music.apple.com/us/artist/815635315', 'https://www.instagram.com/lukecombs/', 'Charlotte', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: This One’s for You
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '46b9faa2-f084-44eb-9f44-becce55f70ef', 'This One’s for You',
        'Album', 'http://coverartarchive.org/release-group/c2418821-b690-4cb8-9944-592386299150/front',
        3567, 17, '2016-06-18','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: What You See Is What You Get
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6107b220-9d01-4e3a-894a-1c5101930fa4', 'What You See Is What You Get',
        'Album', 'http://coverartarchive.org/release-group/e9fc93bc-1a36-4725-9f7c-10d920b7cbed/front',
        3586, 17, '2019-11-08','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Growin’ Up
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6cf90abd-e300-4a1d-876c-0c100a27450c', 'Growin’ Up',
        'Album', 'http://coverartarchive.org/release-group/5e359856-3d25-42e5-80e4-91fac3db6ce0/front',
        2484, 12, '2022-06-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Gettin’ Old
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b50ba0ff-433c-4904-a91b-51333cfa98fb', 'Gettin’ Old',
        'Album', 'http://coverartarchive.org/release-group/4dd05327-b70f-4d7b-b950-367ecdd29b66/front',
        3979, 18, '2023-03-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Fathers & Sons
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6a99dfcf-560a-456e-aa3a-980bf221ad66', 'Fathers & Sons',
        'Album', 'http://coverartarchive.org/release-group/287cb6a8-4c0c-441f-88f1-f93549436579/front',
        2416, 12, '2024-06-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Sabrina Carpenter
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('e10baff8-5c1c-4a88-b8b3-3b3a963346ca', 'Sabrina Carpenter', '', 'https://placehold.co/400?text=Sabrina%20Carpenter', 'https://open.spotify.com/artist/74KM79TiuVKeVCqs8QtB0B','https://music.apple.com/us/artist/390647681', 'https://www.instagram.com/sabrinacarpenter/', 'Bucks County', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Eyes Wide Open
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '82e6dd5d-e95f-4d6b-85f9-3a60a07a288f', 'Eyes Wide Open',
        'Album', 'http://coverartarchive.org/release-group/098b431c-7e67-42ff-841a-ca79cac99a09/front',
        2437, 12, '2015-04-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: EVOLution
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0b32cce4-78bb-44ab-8bd7-a712f6a5d006', 'EVOLution',
        'Album', 'http://coverartarchive.org/release-group/d3b429d5-e066-4e4a-8729-49c60a041425/front',
        2001, 10, '2016-10-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Singular: Act I
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '86b0497f-9b70-47d7-aff3-dd8f522fa6d2', 'Singular: Act I',
        'Album', 'http://coverartarchive.org/release-group/f2f2f9fe-f3ee-479b-99c3-f63f3b8230d2/front',
        1501, 8, '2018-11-09','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Singular: Act II
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'aa3a93f0-9f54-4910-be7b-0f43a166d949', 'Singular: Act II',
        'Album', 'http://coverartarchive.org/release-group/5fbab65e-737a-4883-8162-850eae076393/front',
        2139, 11, '2019-07-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: emails i can’t send
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '23b20d47-3724-411b-b038-16bff118c244', 'emails i can’t send',
        'Album', 'http://coverartarchive.org/release-group/6bbcb652-6188-4a5c-9125-b745d16e1f27/front',
        2360, 13, '2022-07-15','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: YoungBoy Never Broke Again
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('3218facc-cd7e-4448-898f-ae5abc6c3516', 'YoungBoy Never Broke Again', '', 'https://placehold.co/400?text=YoungBoy%20Never%20Broke%20Again', 'https://open.spotify.com/artist/7wlFDEWiM5OoIAt8RSli8b','https://music.apple.com/us/artist/1168822104', 'https://www.instagram.com/nba_youngboy/', 'Baton Rouge', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('gangsta-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gangsta-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Until Death Call My Name
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6fbc9881-8587-4b6f-b4d4-3764b1bdc70d', 'Until Death Call My Name',
        'Album', 'http://coverartarchive.org/release-group/c17af43b-0821-42b6-b575-714b2d90f273/front',
        2365, 13, '2018-04-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('gangsta-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gangsta-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Top
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '49ca5656-20be-401e-8742-a4e56e3e1f12', 'Top',
        'Album', 'http://coverartarchive.org/release-group/9258704f-6c46-4a3c-8379-cd1ec9aac375/front',
        3529, 21, '2020-09-11','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('gangsta-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gangsta-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Sincerely, Kentrell
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '03152d38-71cf-4cf3-a38e-0bc4299aaa8c', 'Sincerely, Kentrell',
        'Album', 'http://coverartarchive.org/release-group/34460778-b6eb-4356-a73c-2122679a8682/front',
        3488, 21, '2021-09-23','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('gangsta-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gangsta-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Last Slimeto
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'a45dd3bb-34d3-4ccb-aefd-8b92a4fc0f63', 'The Last Slimeto',
        'Album', 'http://coverartarchive.org/release-group/cd9dfabd-6ed0-425f-99e1-c40c4ac026a9/front',
        4830, 30, '2022-08-03','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('gangsta-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gangsta-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: I Rest My Case
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'e2af3457-845c-4279-8c6c-91980274f572', 'I Rest My Case',
        'Album', 'http://coverartarchive.org/release-group/68e0b967-2772-4122-b2c3-93d2e90c3f9c/front',
        2390, 19, '2023-01-06','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('gangsta-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gangsta-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Ella Langley
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('fc1879d9-8156-4928-ba75-9ffb5c651a0b', 'Ella Langley', 'American jazz singer', 'https://placehold.co/400?text=Ella%20Langley', 'https://open.spotify.com/artist/5V0MlUE1Bft0mbLlND7FJz','https://music.apple.com/us/artist/73568', NULL, 'Newport News', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('aln-sh') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aln-sh';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('live') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'live';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Souvenir Album
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '77959885-d283-4284-82f2-1a6d594efab4', 'Souvenir Album',
        'Album', 'http://coverartarchive.org/release-group/1cc684d8-cede-492b-9828-1a2889996eef/front',
        0, 8, '1949-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('aln-sh') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aln-sh';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('live') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'live';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Ella Sings Gershwin
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '08a2ab47-0744-47e2-9317-01aec0b73ff3', 'Ella Sings Gershwin',
        'Album', 'http://coverartarchive.org/release-group/c63316e6-dcbb-460b-a103-f4a8f63c510f/front',
        1538, 8, '1950-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('aln-sh') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aln-sh';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('live') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'live';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Ella-Songs in a Mellow Mood
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2e403816-8c00-43e0-893e-097a550ccf46', 'Ella-Songs in a Mellow Mood',
        'Album', 'http://coverartarchive.org/release-group/f7e65e2b-020e-4ba4-a7bf-d5fa485f2581/front',
        2276, 12, '1954-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('aln-sh') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aln-sh';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('live') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'live';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Lullabies of Birdland
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '41b31576-4e30-4955-ad6a-64ad769b42ff', 'Lullabies of Birdland',
        'Album', 'http://coverartarchive.org/release-group/cdd584cb-f2ad-4e2c-bbaa-ebd6fef96d35/front',
        2095, 11, '1955-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('aln-sh') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aln-sh';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('live') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'live';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Sweet and Hot
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'cba94eee-6aa6-4e5c-a2dd-8c225142fe4f', 'Sweet and Hot',
        'Album', 'http://coverartarchive.org/release-group/3b0ce0a7-9716-3b7a-8a0b-21258fa734ab/front',
        1932, 11, '1955-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('aln-sh') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'aln-sh';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('live') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'live';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Drake
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('f3d16c3f-4e32-4455-a536-083d2dab48a0', 'Drake', 'Canadian rapper', 'https://placehold.co/400?text=Drake', 'https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4','https://music.apple.com/gb/artist/271256', 'https://www.instagram.com/champagnepapi/', 'Toronto', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Thank Me Later
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'fcf8764b-a79a-432b-9c47-f443f5d5ec9b', 'Thank Me Later',
        'Album', 'http://coverartarchive.org/release-group/7c0efd43-6023-400d-8d5c-d808b1cb4094/front',
        3926, 15, '2010-06-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Take Care
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'bed0379e-4827-4a54-9c46-6f2ac5f6d52f', 'Take Care',
        'Album', 'http://coverartarchive.org/release-group/47809021-4515-4215-beea-db3f5dfb6267/front',
        4791, 17, '2011-11-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Nothing Was the Same
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'fd12d42d-0f84-4ec7-970c-70b2deefbf4f', 'Nothing Was the Same',
        'Album', 'http://coverartarchive.org/release-group/0b6c2da8-ac60-4663-beae-bd3dc6dea94a/front',
        4317, 16, '2013-09-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Views
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '75c7ba6b-273b-4a27-b94c-c37062aa885b', 'Views',
        'Album', 'http://coverartarchive.org/release-group/4aaaa715-df17-43b8-987e-04b54ec4a697/front',
        4849, 20, '2016-04-29','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Scorpion
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9b8e1f89-b921-47fa-81a5-1ba201c6336f', 'Scorpion',
        'Album', 'http://coverartarchive.org/release-group/857db798-5c31-4d5f-991a-6667f41d8899/front',
        5426, 25, '2018-06-29','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Madison Beer
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('a4b12cdd-133a-42b9-85e9-defc3234c6c7', 'Madison Beer', '', 'https://placehold.co/400?text=Madison%20Beer', 'https://open.spotify.com/artist/2kRfqPViCqYdSGhYSM9R0Q','https://music.apple.com/us/artist/696146587', 'https://www.instagram.com/madisonbeer/', 'Nassau County', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Life Support
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '97e48bef-e8f7-454f-8d59-12bb59792480', 'Life Support',
        'Album', 'http://coverartarchive.org/release-group/19384c11-2bfa-432b-a53a-561d934a4f01/front',
        2791, 17, '2021-02-26','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Silence Between Songs
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ce76374e-f28c-4286-831d-8f73346e74bb', 'Silence Between Songs',
        'Album', 'http://coverartarchive.org/release-group/b65c057a-1290-4873-af8c-c6d5b4591db6/front',
        2915, 15, '2022-09-02','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: locket
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '96a4b5e4-3dc3-4608-b602-b5ff286d79a2', 'locket',
        'Album', 'http://coverartarchive.org/release-group/2a240439-f360-4464-b416-b46712abd93b/front',
        2014, 11, '2026-01-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Half of It: A Memoir
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd5b9616b-7b7e-4fab-8d5e-90b071adf8e0', 'The Half of It: A Memoir',
        'Album', 'http://coverartarchive.org/release-group/b07ee22a-87c8-4d8e-a86f-0a8b73c9579e/front',
        13960, 35, '2023-04-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Kendrick Lamar
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('34581076-2c8d-4d07-9e71-b134b145a56c', 'Kendrick Lamar', '', 'https://placehold.co/400?text=Kendrick%20Lamar', 'https://open.spotify.com/artist/2YZyLoL8N0Wb9xBt1NhZWg','https://music.apple.com/us/artist/368183298', 'https://www.instagram.com/kendricklamar/', 'Compton', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alternative-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-rapper') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-rapper';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Section.80
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ace38d2c-2370-4f78-b001-ee59fb89b3ba', 'Section.80',
        'Album', 'http://coverartarchive.org/release-group/ceccd668-a928-4041-a3c3-99a5ce880de9/front',
        3585, 16, '2011-07-02','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-rapper') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-rapper';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: good kid, m.A.A.d city
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '749042e6-ab7f-4866-8ae9-1ac0764d2270', 'good kid, m.A.A.d city',
        'Album', 'http://coverartarchive.org/release-group/499c19c8-0dab-4824-884b-6191d145e95b/front',
        4684, 14, '2012-10-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-rapper') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-rapper';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: To Pimp a Butterfly
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2cf38cdb-d7b5-41fe-8caa-27c15fa1be72', 'To Pimp a Butterfly',
        'Album', 'http://coverartarchive.org/release-group/d9103c72-3807-4378-9ce7-b6f3e8fdd547/front',
        4739, 16, '2015-03-15','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-rapper') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-rapper';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: DAMN.
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd01fe599-60c9-41ef-990b-0ab519311434', 'DAMN.',
        'Album', 'http://coverartarchive.org/release-group/b88655ba-7469-48b8-a296-b9011ab73ef3/front',
        3249, 14, '2017-04-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-rapper') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-rapper';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Mr. Morale & the Big Steppers
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8211f34c-0f9d-4f4e-b286-3a0ea63085a4', 'Mr. Morale & the Big Steppers',
        'Album', 'http://coverartarchive.org/release-group/6bd70eee-bd46-4738-851a-f50c19d8d6db/front',
        4393, 18, '2022-05-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('conscious-rapper') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'conscious-rapper';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Tate McRae
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('54a20698-be23-469b-b5a1-9431640b6949', 'Tate McRae', '', 'https://placehold.co/400?text=Tate%20McRae', 'https://open.spotify.com/artist/45dkTj5sMRSjrmBSBeiHym','https://music.apple.com/us/artist/1446365464', 'https://www.instagram.com/tatemcrae/', 'Calgary', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The One Day LP
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f74cc252-dbd1-44ae-b0d1-735400182dc7', 'The One Day LP',
        'Album', 'http://coverartarchive.org/release-group/288a3904-31a9-4465-b4e3-26d408c9fa71/front',
        1752, 9, '2021-01-27','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: i used to think i could fly
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '096fe71c-5133-433e-a615-dfddef8bc033', 'i used to think i could fly',
        'Album', 'http://coverartarchive.org/release-group/248271da-8240-450e-9959-b2f05fefb988/front',
        2038, 12, '2022-05-27','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: THINK LATER
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'fa03a45e-6583-4af9-970e-0c4a3e0a06be', 'THINK LATER',
        'Album', 'http://coverartarchive.org/release-group/6e924cee-9945-4a1b-b4c6-3445f846c01f/front',
        2303, 14, '2023-12-07','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: So Close to What
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9eff701f-3e58-4ff5-92b8-9f409b15eb62', 'So Close to What',
        'Album', 'http://coverartarchive.org/release-group/3607f069-61cb-4e4a-b450-863ad0cf7f95/front',
        2213, 13, '2025-02-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: HUNTR/X: EJAE, Audrey Nuna & REI AMI
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('b4d75f8a-5062-4f3a-9012-065ecd6f483a', 'HUNTR/X: EJAE, Audrey Nuna & REI AMI', 'Korean American R&B artist', 'https://placehold.co/400?text=HUNTR/X%3A%20EJAE%2C%20Audrey%20Nuna%20%26%20REI%20AMI', 'https://open.spotify.com/artist/0Wwji82sLA0Hcvtuak3omb','https://music.apple.com/us/artist/1444332093', 'https://www.instagram.com/helloavdrey/', 'New Jersey', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: a liquid breakfast
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b912cbeb-14c1-40fe-b9bc-a434b7059af2', 'a liquid breakfast',
        'Album', 'http://coverartarchive.org/release-group/e7bf6698-d02c-49f2-b5c2-f85571062a11/front',
        1562, 10, '2021-05-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: TRENCH
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6d7491e0-6199-417b-8878-b94e4be4a611', 'TRENCH',
        'Album', 'http://coverartarchive.org/release-group/865db7f0-cdef-4c76-b7e1-67a55273c356/front',
        2508, 16, '2024-10-18','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Fleetwood Mac
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('63c202d5-9082-4128-9b45-5eb1ca4ab7c8', 'Fleetwood Mac', '', 'https://placehold.co/400?text=Fleetwood%20Mac', 'https://open.spotify.com/artist/08GQAI4eElDnROBrJRGE0X','https://music.apple.com/gb/artist/158038', NULL, 'London', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british-blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british-blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Peter Green’s Fleetwood Mac
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '08ddf9c2-0520-427a-a11c-570b1d4d6a5b', 'Peter Green’s Fleetwood Mac',
        'Album', 'http://coverartarchive.org/release-group/ccac79cd-3df4-3fd1-80bd-a328dc049664/front',
        2136, 12, '1968-02-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british-blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british-blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Mr. Wonderful
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8211f099-e4a4-4c75-a21b-9c683acd8b94', 'Mr. Wonderful',
        'Album', 'http://coverartarchive.org/release-group/265dda3d-802e-3e21-b133-34ac7e064146/front',
        2483, 12, '1968-08-23','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british-blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british-blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Biggest Thing Since Colossus
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b07d422d-aa8f-4459-bf65-d5ca42be7db1', 'The Biggest Thing Since Colossus',
        'Album', 'http://coverartarchive.org/release-group/51c70552-4906-3b27-b3f4-f64e764551d0/front',
        2408, 10, '1969-01-09','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british-blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british-blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Then Play On
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '02e9f3af-0589-463d-ac6f-198dd5304bf6', 'Then Play On',
        'Album', 'http://coverartarchive.org/release-group/f8d4b05b-e5dc-3c67-aed8-13cac163b06c/front',
        3171, 14, '1969-09-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british-blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british-blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Kiln House
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0a8a79de-3762-4445-b4e5-08f93ace0f8e', 'Kiln House',
        'Album', 'http://coverartarchive.org/release-group/612a2c86-9e8f-385b-89a3-c22f00d9a44f/front',
        2070, 10, '1970-09-18','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british-blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british-blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('classic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'classic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soft-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soft-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('blues-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'blues-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: SZA
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('f6c72a90-7367-4b4a-8892-71b3ae9cc101', 'SZA', '', 'https://placehold.co/400?text=SZA', 'https://open.spotify.com/artist/7tYKF4w9nC0nq9CsPZTHyP','https://music.apple.com/us/artist/605800394', 'https://www.instagram.com/sza/', 'St. Louis', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Ctrl
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '412a1658-bbb9-4651-ae15-f53e5c235043', 'Ctrl',
        'Album', 'http://coverartarchive.org/release-group/8f892c1b-0709-4cf4-9711-493892a9eb9b/front',
        2944, 14, '2017-06-09','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: SOS
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '62a5fe6b-b6cf-42f8-98aa-05e87ab56d86', 'SOS',
        'Album', 'http://coverartarchive.org/release-group/1646286a-d0ad-4288-bfab-34b0fb7b22c1/front',
        4083, 23, '2022-12-09','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: sombr
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('c9d46db0-4825-40f3-bbfc-924405660029', 'sombr', '', 'https://placehold.co/400?text=sombr', 'https://open.spotify.com/artist/4G9NDjRyZFDlJKMRL8hx3S','https://music.apple.com/us/artist/1589842503', 'https://www.instagram.com/somb.r/', 'New York', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: I Barely Know Her
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'e7b46462-ddcb-49fb-bce2-7f813647d348', 'I Barely Know Her',
        'Album', 'http://coverartarchive.org/release-group/38103ba1-04f5-4e4c-b2c4-b769c0ed2eee/front',
        2264, 10, '2025-08-22','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Alex Warren
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('e0250d4d-b367-4bc3-a098-fba4e5722d3a', 'Alex Warren', '', 'https://placehold.co/400?text=Alex%20Warren', 'https://open.spotify.com/artist/7qw07ZScuYvw3zn7neAazm',NULL, NULL, 'United Kingdom', 'Person')
    RETURNING art_id INTO v_art_id;


    -- Album: In The Groove
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '4eb628f9-56b9-4e1c-848a-668ea2ba25ef', 'In The Groove',
        'Album', 'http://coverartarchive.org/release-group/68e1ea5a-e3b9-4ac2-8144-0c9b9401b68b/front',
        2110, 12, '1985-01-01','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );

    -- Album: Panache
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '779290de-7fbd-445c-b87a-225201f0a5ac', 'Panache',
        'Album', 'http://coverartarchive.org/release-group/95c3cb5d-a043-4226-818b-b71ae7afbab9/front',
        2548, 15, '1988-01-01','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: The Weeknd
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('3b1df172-0934-4b1f-b851-b3d4f3a7c45f', 'The Weeknd', 'Canadian R&B singer', 'https://placehold.co/400?text=The%20Weeknd', 'https://open.spotify.com/artist/1Xyo4u8uXC1ZmMpatF05PJ','https://music.apple.com/ca/artist/479756766', 'https://www.instagram.com/abelxo/', 'Scarborough', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hypnagogic-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hypnagogic-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Kiss Land
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '963931f4-477d-4a7f-997b-9a62e676943e', 'Kiss Land',
        'Album', 'http://coverartarchive.org/release-group/de9470f4-f4a3-4ddf-967b-ac77c886ad49/front',
        3339, 10, '2013-09-09','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hypnagogic-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hypnagogic-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Beauty Behind the Madness
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c2f276b4-e4fd-405f-a6fd-63732c7f03fe', 'Beauty Behind the Madness',
        'Album', 'http://coverartarchive.org/release-group/a85b8aff-fcbc-4431-95ba-d8c20bbfb77e/front',
        3912, 14, '2015-08-28','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hypnagogic-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hypnagogic-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Starboy
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd4b454a0-e25b-4b28-b06d-e9cfb51a08a1', 'Starboy',
        'Album', 'http://coverartarchive.org/release-group/ceaa5c39-91c7-4c8a-886c-85b11fa8a1f6/front',
        4115, 18, '2016-11-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hypnagogic-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hypnagogic-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: After Hours
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2fccbcf0-5267-425b-93a2-f08e58c08c0a', 'After Hours',
        'Album', 'http://coverartarchive.org/release-group/78570bea-2a26-467c-a3db-c52723ceb394/front',
        3377, 14, '2020-02-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hypnagogic-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hypnagogic-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Dawn FM
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2025643b-0cbb-4585-86bf-3ecd6c08f954', 'Dawn FM',
        'Album', 'http://coverartarchive.org/release-group/3344452a-3da9-4b4f-8954-ae23a86c2ecf/front',
        3109, 16, '2022-01-07','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hypnagogic-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hypnagogic-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Billie Eilish
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('ee1d1b3a-747c-47c9-9afa-f04c321046f5', 'Billie Eilish', '', 'https://placehold.co/400?text=Billie%20Eilish', 'https://open.spotify.com/user/billieeilish','https://music.apple.com/us/artist/1065981054', 'https://www.instagram.com/billieeilish/', 'Los Angeles', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nepo-baby') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nepo-baby';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('queer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'queer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dark-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dark-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alt-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pity-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pity-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '318b1af2-0d10-48a8-8b2c-07a6b0dc0bea', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?',
        'Album', 'http://coverartarchive.org/release-group/72375978-a9a1-4254-b957-85565c716b7e/front',
        2575, 14, '2019-03-29','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nepo-baby') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nepo-baby';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('queer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'queer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dark-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dark-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alt-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pity-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pity-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Happier Than Ever
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f18cb1ee-ac72-4fbc-aa2a-756bfa47fe90', 'Happier Than Ever',
        'Album', 'http://coverartarchive.org/release-group/3ac5236a-3bd8-44c6-ab60-69b013594ae6/front',
        3374, 16, '2021-07-30','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nepo-baby') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nepo-baby';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('queer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'queer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dark-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dark-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alt-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pity-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pity-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: HIT ME HARD AND SOFT
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '32737a5e-ce97-4dcf-901b-584ea96364d7', 'HIT ME HARD AND SOFT',
        'Album', 'http://coverartarchive.org/release-group/02a544b3-0459-42c7-bd9c-047162e7b67a/front',
        2628, 10, '2024-05-17','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nepo-baby') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nepo-baby';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('queer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'queer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dark-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dark-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alt-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pity-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pity-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gen-z') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gen-z';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Stray Kids
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('1c4cb701-b3bd-4ead-ad9a-282b60aa2d1b', 'Stray Kids', 'South Korean boy group', 'https://placehold.co/400?text=Stray%20Kids', 'https://open.spotify.com/artist/2dIgFjalVxs4ThymZ67YCE','https://music.apple.com/gb/artist/1304823362', 'https://www.instagram.com/realstraykids/', 'Seoul', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('4th-gen-k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '4th-gen-k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: GO生
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'a78f1bfd-c0b0-41f2-9bc2-e03822c910fc', 'GO生',
        'Album', 'http://coverartarchive.org/release-group/216ffd78-75ed-48f0-93b1-712d06153020/front',
        2633, 14, '2020-06-17','mul')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('4th-gen-k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '4th-gen-k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: NOEASY
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'bfe4ed4e-7f06-48d1-bb02-6f4a330a6907', 'NOEASY',
        'Album', 'http://coverartarchive.org/release-group/dc8b1089-fcdb-4d4a-9a41-ac37d8a03ce7/front',
        2794, 14, '2021-08-23','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('4th-gen-k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '4th-gen-k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: THE SOUND
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b104bfe0-0da7-41d3-9a48-0a165249cbaf', 'THE SOUND',
        'Album', 'http://coverartarchive.org/release-group/498d6e37-11ca-4f3d-828a-f20cc0451725/front',
        1959, 17, '2023-02-22','mul')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('4th-gen-k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '4th-gen-k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: ★★★★★
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '3d2521cf-f257-4bf3-969d-854a1e8afa37', '★★★★★',
        'Album', 'http://coverartarchive.org/release-group/44419f5b-2816-4cbb-a380-954f54f0751d/front',
        2190, 12, '2023-06-02','mul')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('4th-gen-k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '4th-gen-k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: GIANT
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'be773530-4a96-46bf-9fd1-971e77d8a616', 'GIANT',
        'Album', 'http://coverartarchive.org/release-group/4b673922-02df-4e60-93a9-c441b55cb80e/front',
        1887, 10, '2024-11-13','mul')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('boy-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boy-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boy-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('4th-gen-k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '4th-gen-k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Benson Boone
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('af5e6425-a90a-4cbd-84c8-2bea498a454e', 'Benson Boone', '', 'https://placehold.co/400?text=Benson%20Boone', 'https://open.spotify.com/artist/7fmKtIgmxqNEKjATioVNsu','https://music.apple.com/us/artist/34523', NULL, 'Jacksonville', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ballad') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ballad';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock--roll') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock--roll';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Pat Boone
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '5ab1267a-0f9f-4ac4-a8fc-40e810d2e6c2', 'Pat Boone',
        'Album', 'http://coverartarchive.org/release-group/0a7ad157-2b60-4f98-bd03-45faeb7839eb/front',
        1767, 12, '1956-05-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ballad') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ballad';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock--roll') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock--roll';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Howdy!
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ba0f78ec-83a8-4ffb-adea-866de900067f', 'Howdy!',
        'Album', 'http://coverartarchive.org/release-group/23e65839-60e3-479c-a66a-7ab899e6db2d/front',
        1852, 12, '1956-09-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ballad') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ballad';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock--roll') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock--roll';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: “Pat”
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '3a06e6e5-9b54-4f23-a332-6a79aa12f624', '“Pat”',
        'Album', 'http://coverartarchive.org/release-group/8afd8bd7-5a66-4d54-9f4b-adb8e76fae38/front',
        1743, 12, '1957-02-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ballad') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ballad';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock--roll') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock--roll';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Hymns We Love
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '24472581-9553-4002-b545-5100525c2c59', 'Hymns We Love',
        'Album', 'http://coverartarchive.org/release-group/73372de3-182b-48c7-9d33-a94fd3eab5a4/front',
        1779, 12, '1957-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ballad') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ballad';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock--roll') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock--roll';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Sings Irving Berlin
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '63270e54-b04b-4014-bda9-ca72feac640b', 'Sings Irving Berlin',
        'Album', 'http://coverartarchive.org/release-group/6c54b35f-b073-4498-904c-11eeb8b49401/front',
        2037, 14, '1957-01-01','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ballad') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ballad';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock--roll') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock--roll';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2008-universal-fire-victim') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2008-universal-fire-victim';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: KATSEYE
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('1c418b20-2bfe-4727-a74d-396a86b0b7e1', 'KATSEYE', '', 'https://placehold.co/400?text=KATSEYE', 'https://open.spotify.com/artist/3c0gDdb9lhnHGFtP4prQpn','https://music.apple.com/us/artist/1754284416', 'https://www.instagram.com/katseyeworld/', 'Los Angeles', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('k-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'k-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('girl-group') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'girl-group';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Justin Bieber
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('ee4276af-0d1a-46d8-8f1f-8bc2836746e2', 'Justin Bieber', '', 'https://placehold.co/400?text=Justin%20Bieber', 'https://open.spotify.com/artist/1uNFoZAHBGtllmzznpCI3s','https://music.apple.com/ca/artist/320569549', 'https://www.instagram.com/justinbieber/', 'London', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('teen-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'teen-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: My World 2.0
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '340cbd2e-005a-4b3d-843a-f7461251865a', 'My World 2.0',
        'Album', 'http://coverartarchive.org/release-group/eb68ecd6-fb1e-483a-9cda-b595fb4664a7/front',
        2696, 12, '2010-03-23','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('teen-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'teen-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Under the Mistletoe
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b69013e7-647e-4838-8cc8-b457125d0120', 'Under the Mistletoe',
        'Album', 'http://coverartarchive.org/release-group/5708e8f4-71a5-4f47-9b30-d36a0e3bdc56/front',
        2271, 11, '2011-11-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('teen-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'teen-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Believe
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '468be19b-439e-4ab9-80bd-718cf2ff8713', 'Believe',
        'Album', 'http://coverartarchive.org/release-group/df46f245-7f62-4982-9d2c-e83d7be91cbf/front',
        3597, 19, '2012-01-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('teen-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'teen-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Purpose
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '465037c1-c642-438f-bfc8-ddf7d1437a80', 'Purpose',
        'Album', 'http://coverartarchive.org/release-group/2660de3c-56db-4bd1-bf99-e162c68e5712/front',
        3975, 18, '2015-11-12','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('teen-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'teen-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Changes
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'e1bf812e-10e2-4f52-9b95-4fe9629a72f2', 'Changes',
        'Album', 'http://coverartarchive.org/release-group/7f673bef-5e95-46a7-baa2-8f29df0624cf/front',
        2885, 16, '2020-02-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('teen-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'teen-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Rihanna
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('f502e346-dfc7-4ffb-863e-773cb97027d1', 'Rihanna', 'Barbadian R&B/pop singer', 'https://placehold.co/400?text=Rihanna', 'https://open.spotify.com/artist/5pKCCKE2ajJHZ9KAiaK11H','https://music.apple.com/us/artist/63346553', 'https://www.instagram.com/badgalriri/', 'Saint Michael', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('barbadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'barbadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dancehall') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dancehall';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('influential-pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'influential-pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-culture') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-culture';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggae') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggae';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Music of the Sun
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '542c07f2-18fc-40eb-a15d-575d7d60d9e9', 'Music of the Sun',
        'Album', 'http://coverartarchive.org/release-group/aefe7de5-11df-38c3-97f5-13df615870fd/front',
        3145, 13, '2005-08-29','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('barbadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'barbadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dancehall') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dancehall';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('influential-pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'influential-pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-culture') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-culture';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggae') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggae';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: A Girl Like Me
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '1b7f9aed-f6c5-4120-850b-36f8d3864dca', 'A Girl Like Me',
        'Album', 'http://coverartarchive.org/release-group/51797d3d-7071-30ee-9fb3-d60aad857ef0/front',
        3238, 14, '2006-04-10','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('barbadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'barbadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dancehall') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dancehall';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('influential-pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'influential-pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-culture') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-culture';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggae') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggae';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Good Girl Gone Bad
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '29bbde77-d691-4c6c-9700-b92d90a7ea42', 'Good Girl Gone Bad',
        'Album', 'http://coverartarchive.org/release-group/7e48f018-b774-32e6-a68b-b42db04535c0/front',
        3277, 14, '2007-03-31','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('barbadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'barbadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dancehall') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dancehall';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('influential-pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'influential-pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-culture') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-culture';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggae') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggae';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Rated R
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '525cf740-cd7d-4887-bd62-f7f449227244', 'Rated R',
        'Album', 'http://coverartarchive.org/release-group/06fda337-5c4b-42e0-a96c-a349c786965f/front',
        3541, 15, '2009-11-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('barbadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'barbadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dancehall') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dancehall';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('influential-pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'influential-pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-culture') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-culture';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggae') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggae';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Loud
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c9344c90-52e9-4f8b-bea8-43140703af03', 'Loud',
        'Album', 'http://coverartarchive.org/release-group/7c6de97d-bf6a-4793-82f5-f142baed33e6/front',
        3300, 13, '2010-08-18','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('barbadian') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'barbadian';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dancehall') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dancehall';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('influential-pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'influential-pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-culture') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-culture';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('reggae') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'reggae';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-star') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-star';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Djo
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('5e81b4ff-5118-4b7e-bb72-1d50e022f19c', 'Djo', 'Joe Keery', 'https://placehold.co/400?text=Djo', 'https://open.spotify.com/artist/5p9HO3XC5P3BLxJs5Mtrhm','https://music.apple.com/us/artist/1473178582', 'https://www.instagram.com/djotime/', 'Newburyport', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('neo-psychedelia') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-psychedelia';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Twenty Twenty
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c9d25e9b-d8a1-404e-aafe-b053872f43be', 'Twenty Twenty',
        'Album', 'http://coverartarchive.org/release-group/d6cd3eb9-d825-4159-8603-7859cacca61e/front',
        2638, 12, '2019-09-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('neo-psychedelia') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-psychedelia';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: DECIDE
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0a827fb7-fb54-43ca-bb31-1c6f66513606', 'DECIDE',
        'Album', 'http://coverartarchive.org/release-group/de1ae079-0167-4ea4-96c9-a7a109ba1a56/front',
        2163, 13, '2022-09-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('neo-psychedelia') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-psychedelia';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Crux
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '1a45fadd-8ca1-4e8c-9531-b78a2dfa4700', 'The Crux',
        'Album', 'http://coverartarchive.org/release-group/e9e68b97-c02e-4ed1-ac94-4f9369e563ff/front',
        2718, 12, '2025-04-04','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('neo-psychedelia') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-psychedelia';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('bedroom-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bedroom-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Chris Stapleton
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('05800755-9a9c-480a-9867-af5d5f504902', 'Chris Stapleton', 'American singer‐songwriter', 'https://placehold.co/400?text=Chris%20Stapleton', 'https://open.spotify.com/artist/4YLtscXsxbVgi031ovDDdh','https://music.apple.com/us/artist/1752134', NULL, 'Lexington', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('bluegrass') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bluegrass';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('outlaw-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'outlaw-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Traveller
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8dc7ad42-ae89-4261-8130-e82aaf770321', 'Traveller',
        'Album', 'http://coverartarchive.org/release-group/69a03496-ba64-4d55-a01e-2f2f34f36a61/front',
        3784, 14, '2015-05-04','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('bluegrass') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bluegrass';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('outlaw-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'outlaw-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: From A Room, Volume 1
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'decccd62-54cb-485c-92ee-b81215b23bf3', 'From A Room, Volume 1',
        'Album', 'http://coverartarchive.org/release-group/c9f94737-297f-414d-8bd0-b1e482dbf983/front',
        1952, 9, '2017-05-05','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('bluegrass') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bluegrass';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('outlaw-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'outlaw-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: From A Room, Volume 2
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '37871c85-963e-4dcc-8148-ea6f8fe2cf69', 'From A Room, Volume 2',
        'Album', 'http://coverartarchive.org/release-group/3d6f549e-412f-4e72-bfc3-0dede31311fa/front',
        1943, 9, '2017-12-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('bluegrass') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bluegrass';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('outlaw-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'outlaw-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Starting Over
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '7c8af93b-fb26-4ac0-bcc0-488ade09d82d', 'Starting Over',
        'Album', 'http://coverartarchive.org/release-group/1495c73e-9da2-464e-9cbf-15ae7b38fd4c/front',
        3220, 14, '2020-11-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('bluegrass') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bluegrass';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('outlaw-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'outlaw-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Higher
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '02e8cebe-8ff3-4546-adb6-3df7d07b7897', 'Higher',
        'Album', 'http://coverartarchive.org/release-group/6f6d1ee6-bd84-496f-946c-740cf494df74/front',
        3276, 14, '2023-11-10','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('bluegrass') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'bluegrass';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('southern-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'southern-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('outlaw-country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'outlaw-country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Shaboozey
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('ed87a25f-326b-4200-8171-020bbdab2e20', 'Shaboozey', '', 'https://placehold.co/400?text=Shaboozey', 'https://open.spotify.com/artist/3y2cIKLjiOlp1Np37WiUdH','https://music.apple.com/us/artist/914125510', 'https://www.instagram.com/shaboozey/', 'Fairfax', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('stomp-and-holler') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'stomp-and-holler';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Lady Wrangler
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8e875366-c087-4881-91c9-a73437904aec', 'Lady Wrangler',
        'Album', 'http://coverartarchive.org/release-group/a4eebaba-8845-4229-b1d9-64818c49961b/front',
        2333, 11, '2018-10-05','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('stomp-and-holler') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'stomp-and-holler';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cowboys Live Forever, Outlaws Never Die
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'a3ff8d5f-3500-4e32-8604-6515ac64da09', 'Cowboys Live Forever, Outlaws Never Die',
        'Album', 'http://coverartarchive.org/release-group/7bacba4e-0d82-413a-ac91-7fa51a3cfb38/front',
        1959, 14, '2022-10-07','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('stomp-and-holler') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'stomp-and-holler';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Where I’ve Been, isn’t Where I’m Going
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'bf12ced2-2a33-449d-a15e-91faaa55099f', 'Where I’ve Been, isn’t Where I’m Going',
        'Album', 'http://coverartarchive.org/release-group/3d406cea-785a-4259-89c3-b7e5e6bd9df3/front',
        2274, 12, '2024-05-30','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('stomp-and-holler') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'stomp-and-holler';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Megan Moroney
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('bf8e6764-2fdc-424f-b25a-fbc7cae90413', 'Megan Moroney', 'country music singer/songwriter', 'https://placehold.co/400?text=Megan%20Moroney', 'https://open.spotify.com/artist/5Ppie0uPnbnvGBYRwYmlt0','https://music.apple.com/us/artist/1552469569', 'https://www.instagram.com/megmoroney/', 'Savannah', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Lucky
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '89919485-a73b-41fb-9b08-c72a65b5c80a', 'Lucky',
        'Album', 'http://coverartarchive.org/release-group/2df32ebb-4fa5-479d-97c4-6a3acb9bd424/front',
        2531, 13, '2023-05-05','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Am I Okay?
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '928e7517-c097-4545-a12e-3d11f29ac473', 'Am I Okay?',
        'Album', 'http://coverartarchive.org/release-group/c1f83265-8b30-4a34-a843-ffcf01d56a75/front',
        2745, 14, '2024-07-12','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cloud 9
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'df761949-5911-408d-babd-667fdaf7df19', 'Cloud 9',
        'Album', 'http://coverartarchive.org/release-group/62a602e3-ddee-4bbe-8d3c-c27ff258acad/front',
        0, 0, NULL,'Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Teddy Swims
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('78590bf8-928d-4415-b854-9d1a788148a9', 'Teddy Swims', 'American singer and songwriter', 'https://placehold.co/400?text=Teddy%20Swims', 'https://open.spotify.com/artist/33qOK5uJ8AR2xuQQAhHump','https://music.apple.com/us/artist/1462541757', 'https://www.instagram.com/teddyswims/', 'Conyers', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rhythm--blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rhythm--blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: I've Tried Everything but Therapy (Part 1)
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '7feb2eba-9e8b-4551-87f6-affff22681bb', 'I''ve Tried Everything but Therapy (Part 1)',
        'Album', 'http://coverartarchive.org/release-group/9158fd07-1bce-4cb1-9997-b57892b85825/front',
        1875, 10, '2023-06-10','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rhythm--blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rhythm--blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: I've Tried Everything but Therapy (Part 2)
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'faa73216-3d4e-4ad9-b1be-79e06909975a', 'I''ve Tried Everything but Therapy (Part 2)',
        'Album', 'http://coverartarchive.org/release-group/7034130b-9aef-4a12-8626-3889f14795a7/front',
        2447, 13, '2025-01-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rhythm--blues') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rhythm--blues';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Tyler, The Creator
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('1741b809-07ed-40e7-973a-d28cbc0884ac', 'Tyler, The Creator', '', 'https://placehold.co/400?text=Tyler%2C%20The%20Creator', 'https://open.spotify.com/artist/4V8LLVI7PbaPR0K2TGSxFF','https://music.apple.com/us/artist/420368335', 'https://www.instagram.com/feliciathegoat/', 'Hawthorne', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('horrorcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'horrorcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Bastard
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '5a8212a9-e024-4c9b-8e33-a92be0ff03fc', 'Bastard',
        'Album', 'http://coverartarchive.org/release-group/27881759-88c1-48df-aa72-1ec149f1b5c9/front',
        3341, 15, '2009-12-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('horrorcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'horrorcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Goblin
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '185b877d-0586-425c-ab3e-8e689d965eff', 'Goblin',
        'Album', 'http://coverartarchive.org/release-group/5bc030ca-10f1-4d61-bfd2-846873cd9e1b/front',
        4929, 18, '2011-05-10','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('horrorcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'horrorcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Wolf
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '48e36e00-c524-44ac-9fac-99962c2c3852', 'Wolf',
        'Album', 'http://coverartarchive.org/release-group/accf15ec-9dd2-4b26-989e-d3814f5d95c7/front',
        4244, 18, '2013-04-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('horrorcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'horrorcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cherry Bomb
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f0efb300-af5c-4099-b3c5-0181dcee7910', 'Cherry Bomb',
        'Album', 'http://coverartarchive.org/release-group/1ea9701e-f93e-4d88-9eda-16d01c155ff6/front',
        3250, 13, '2015-04-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('horrorcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'horrorcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Flower Boy
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c152c112-d17f-40d7-8d01-4d106e18cb32', 'Flower Boy',
        'Album', 'http://coverartarchive.org/release-group/e248e931-c26c-4c94-aba2-2f89ce583901/front',
        2796, 14, '2017-07-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('horrorcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'horrorcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('west-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'west-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hardcore-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hardcore-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Frank Ocean
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('f54d1818-f8cf-421e-9a77-80973bcfb4b1', 'Frank Ocean', 'American singer and actor, “Ol’ Blue Eyes”', 'https://placehold.co/400?text=Frank%20Ocean', 'https://open.spotify.com/artist/1Mxqyy3pSjf8kZZL4QVxS0','https://music.apple.com/us/artist/171366', NULL, 'Hoboken', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-picture-producers-and-directors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-picture-producers-and-directors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('actors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'actors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acting') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acting';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ultimate') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ultimate';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-pictures--production-and-direction') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-pictures--production-and-direction';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singers') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singers';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Voice of Frank Sinatra
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8b88a86d-9cdf-42eb-974c-71c1431ff4ce', 'The Voice of Frank Sinatra',
        'Album', 'http://coverartarchive.org/release-group/48f05fdb-0a7b-3c7f-b62d-78923d167da7/front',
        1459, 8, '1946-03-04','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-picture-producers-and-directors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-picture-producers-and-directors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('actors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'actors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acting') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acting';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ultimate') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ultimate';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-pictures--production-and-direction') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-pictures--production-and-direction';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singers') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singers';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Songs by Sinatra
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd174da86-1d72-4810-8582-18a0e8ed97ca', 'Songs by Sinatra',
        'Album', 'http://coverartarchive.org/release-group/35fb03e4-2344-3c48-aa93-ea80e9870d8a/front',
        1479, 8, '1947-04-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-picture-producers-and-directors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-picture-producers-and-directors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('actors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'actors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acting') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acting';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ultimate') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ultimate';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-pictures--production-and-direction') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-pictures--production-and-direction';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singers') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singers';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Christmas Songs by Sinatra
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '42e75663-e13b-41df-8262-f68dd6f9ea6a', 'Christmas Songs by Sinatra',
        'Album', 'http://coverartarchive.org/release-group/10fb3238-07c6-30da-80f9-516d33dce786/front',
        1424, 8, '1948-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-picture-producers-and-directors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-picture-producers-and-directors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('actors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'actors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acting') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acting';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ultimate') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ultimate';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-pictures--production-and-direction') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-pictures--production-and-direction';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singers') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singers';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Frankly Sentimental
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '7d4b690b-7b15-43f9-acf0-c6d9c5166151', 'Frankly Sentimental',
        'Album', 'http://coverartarchive.org/release-group/5e7130ec-3e7a-3407-bc1e-821fd6d3ddf9/front',
        1521, 8, '1949-06-20','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-picture-producers-and-directors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-picture-producers-and-directors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('actors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'actors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acting') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acting';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ultimate') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ultimate';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-pictures--production-and-direction') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-pictures--production-and-direction';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singers') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singers';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Dedicated to You
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '701ebf01-7471-4c87-ae24-8659386d9938', 'Dedicated to You',
        'Album', 'http://coverartarchive.org/release-group/141af6b7-6a86-42bc-934b-9dbf726d766b/front',
        1449, 8, '1950-03-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('vocal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('big-band') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'big-band';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('lounge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'lounge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-picture-producers-and-directors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-picture-producers-and-directors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('actors') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'actors';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acting') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acting';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('christmas') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'christmas';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vocal-jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vocal-jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ultimate') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ultimate';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('easy-listening') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'easy-listening';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('motion-pictures--production-and-direction') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'motion-pictures--production-and-direction';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('standards') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'standards';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('traditional-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'traditional-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singers') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singers';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Post Malone
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('b95e78ae-feb6-44d4-aeaf-4840d4e66839', 'Post Malone', '', 'https://placehold.co/400?text=Post%20Malone', 'https://open.spotify.com/artist/246dkjvS1zLTtiykXe5h60','https://music.apple.com/us/artist/966309175', 'https://www.instagram.com/postmalone/', 'Syracuse', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Stoney
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '11a84f3a-ee99-4a4a-9d60-4b0006973737', 'Stoney',
        'Album', 'http://coverartarchive.org/release-group/3843ba6a-0b1e-48c0-bc86-2f64e6d9525c/front',
        3046, 14, '2016-12-09','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: beerbongs & bentleys
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '77730654-6643-4f1f-9cd6-67c4a7bd3363', 'beerbongs & bentleys',
        'Album', 'http://coverartarchive.org/release-group/a6045fe5-c283-4778-995c-04d953fe73e1/front',
        3848, 18, '2018-04-27','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Hollywood’s Bleeding
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b16bfed5-8c44-4c17-bdfb-63d19ae75e44', 'Hollywood’s Bleeding',
        'Album', 'http://coverartarchive.org/release-group/8c9e2ca7-fad0-427c-a963-6bd535992a38/front',
        3061, 17, '2019-09-06','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Twelve Carat Toothache
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9493385f-9aa6-4bf6-b36a-5e2a728d7aaa', 'Twelve Carat Toothache',
        'Album', 'http://coverartarchive.org/release-group/da1ba8df-a869-4270-8af0-b1c7ffd8d44a/front',
        2597, 14, '2022-06-03','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: AUSTIN
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '8a79bdd7-9ef1-41ed-91c4-192a8a05a361', 'AUSTIN',
        'Album', 'http://coverartarchive.org/release-group/eb6f29e8-e0fa-4ba5-9ad8-6bffdf2e25e1/front',
        3103, 17, '2023-07-28','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Kehlani
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('7e41b0de-bff8-4fbc-bcdb-3f2f9329b303', 'Kehlani', '', 'https://placehold.co/400?text=Kehlani', 'https://open.spotify.com/artist/0cGUm45nv7Z6M6qdXYQGTX','https://music.apple.com/us/artist/690126399', 'https://www.instagram.com/kehlani/', 'Oakland', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: SweetSexySavage
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '64ce1514-23e8-481e-9407-7f2b4deca0f2', 'SweetSexySavage',
        'Album', 'http://coverartarchive.org/release-group/9e18d7e3-d335-4f22-9b4f-cf07840814c6/front',
        3793, 19, '2017-01-27','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: It Was Good Until It Wasn’t
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'fe94af65-8ba5-4559-9682-b8317e054bf8', 'It Was Good Until It Wasn’t',
        'Album', 'http://coverartarchive.org/release-group/403f031e-d41d-4a88-935a-edb8a6bb473e/front',
        2366, 15, '2020-05-08','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: blue water road
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '3d9302cc-3f7f-42b5-b708-7bce4072259f', 'blue water road',
        'Album', 'http://coverartarchive.org/release-group/88822d6d-5c6c-4e52-adec-2f5845b81af4/front',
        2271, 13, '2022-04-29','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: CRASH
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ec9ee83c-f7ea-4ec0-8ffa-0f5267ec837f', 'CRASH',
        'Album', 'http://coverartarchive.org/release-group/944cab5e-e08f-433a-8cba-a33b0ddf9238/front',
        2417, 12, '2024-06-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cloud 19
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b1965976-9f5e-407c-b753-a2c070b775b1', 'Cloud 19',
        'Album', 'http://coverartarchive.org/release-group/e06a97dd-be61-4e5c-a47b-a2737c0a18ee/front',
        1528, 8, '2014-08-26','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('neo-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'neo-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Deftones
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('ee407cb1-3d99-4f84-b7e9-f8197617b165', 'Deftones', '', 'https://placehold.co/400?text=Deftones', 'https://open.spotify.com/artist/6Ghvu1VvMGScGpOUJBAHNH','https://music.apple.com/us/artist/1092903', 'https://www.instagram.com/deftones/', 'Sacramento', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('shoegaze') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'shoegaze';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Adrenaline
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'cff0ca04-cff2-488b-aa26-b6f92d6a871c', 'Adrenaline',
        'Album', 'http://coverartarchive.org/release-group/0b4ea447-444c-34ba-ba87-96496f2e15b8/front',
        2827, 11, '1995-10-02','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('shoegaze') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'shoegaze';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Around the Fur
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '22df77e8-2065-480a-a688-983a618c5575', 'Around the Fur',
        'Album', 'http://coverartarchive.org/release-group/6f935b80-160f-3787-97d6-a4ce342cf8c5/front',
        4440, 10, '1997-10-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('shoegaze') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'shoegaze';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: White Pony
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '63387e02-b7c1-4e1c-ba94-9702347182bb', 'White Pony',
        'Album', 'http://coverartarchive.org/release-group/a7d33e96-8e09-3aff-8629-44812a1b8489/front',
        2914, 12, '2000-04-27','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('shoegaze') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'shoegaze';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Deftones
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6433da2d-8179-4eec-8367-aac59a6e2f90', 'Deftones',
        'Album', 'http://coverartarchive.org/release-group/f423c6e6-410c-3b43-94ec-8f7a2c02f052/front',
        2834, 11, '2003-05-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('shoegaze') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'shoegaze';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Saturday Night Wrist
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'cfacbeb8-dffc-4b24-91e1-74a14e9e1ca3', 'Saturday Night Wrist',
        'Album', 'http://coverartarchive.org/release-group/82be2ea8-9c50-3024-a1be-cf35c2e5fd69/front',
        4175, 16, '2005-01-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('shoegaze') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'shoegaze';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Lil Uzi Vert
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('5d8dea4e-1dd3-4466-b110-3d6ccc01170f', 'Lil Uzi Vert', '', 'https://placehold.co/400?text=Lil%20Uzi%20Vert', 'https://open.spotify.com/user/liluzivertofficial','https://music.apple.com/us/artist/940710524', 'https://www.instagram.com/liluzivert/', 'Francisville', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('emo-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'emo-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rage') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rage';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Luv Is Rage 2
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6acb518b-e8ca-4d9d-9523-11f8f71c1d65', 'Luv Is Rage 2',
        'Album', 'http://coverartarchive.org/release-group/0218232d-4b51-4315-a830-8fb91bd6e2c4/front',
        3380, 16, '2017-08-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('emo-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'emo-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rage') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rage';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Eternal Atake
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'de604d69-e963-4a07-ae01-7ef8cce42fc5', 'Eternal Atake',
        'Album', 'http://coverartarchive.org/release-group/4e60f08e-4b53-4139-a8c8-5bd81fad0d62/front',
        3734, 18, '2020-03-06','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('emo-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'emo-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rage') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rage';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Pluto × Baby Pluto
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '1680875d-9c39-4a47-94d0-75ab5117b2bf', 'Pluto × Baby Pluto',
        'Album', 'http://coverartarchive.org/release-group/e9d946c0-2c1f-4de8-aa21-e9811f3d81c5/front',
        3269, 16, '2020-11-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('emo-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'emo-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rage') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rage';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Pink Tape
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f141f78a-5a82-4be1-a582-b3769ec8b3c3', 'Pink Tape',
        'Album', 'http://coverartarchive.org/release-group/4fc5b424-43f0-482a-b8ad-948fcfcebb2d/front',
        5223, 26, '2023-06-30','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('emo-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'emo-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rage') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rage';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Eternal Atake 2
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '89aa8243-c1a1-40e6-a46c-a81b28bf9fb6', 'Eternal Atake 2',
        'Album', 'http://coverartarchive.org/release-group/ba869de3-196f-4ccb-8458-a35912f17516/front',
        2607, 16, '2024-11-01','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('emo-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'emo-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('east-coast-hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'east-coast-hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rage') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rage';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cloud-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cloud-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Metallica
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('eb076a38-52b7-42df-af57-cc02269bb8b3', 'Metallica', '', 'https://placehold.co/400?text=Metallica', 'https://open.spotify.com/artist/2ye2Wgw4gimLv2eAKyk1NB','https://music.apple.com/us/artist/3996865', 'https://www.instagram.com/metallica/', 'Los Angeles', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heavy-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heavy-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('thrash-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'thrash-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Kill ’Em All
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '1ed785b5-4c0f-4d42-aa26-c24cfd8cc711', 'Kill ’Em All',
        'Album', 'http://coverartarchive.org/release-group/f44f4f73-a714-31a1-a4b8-bfcaaf311f50/front',
        3077, 10, '1983-07-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heavy-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heavy-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('thrash-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'thrash-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Ride the Lightning
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c1253f22-e199-476b-8550-782b810d2e75', 'Ride the Lightning',
        'Album', 'http://coverartarchive.org/release-group/0da580f2-6768-498f-af9d-2becaddf15e0/front',
        2848, 8, '1984-07-27','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heavy-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heavy-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('thrash-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'thrash-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Master of Puppets
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '29885869-54d1-4c23-9e99-1681d3cabbe9', 'Master of Puppets',
        'Album', 'http://coverartarchive.org/release-group/3d00fb45-f8ab-3436-a8e1-b4bfc4d66913/front',
        3247, 8, '1986-03-03','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heavy-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heavy-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('thrash-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'thrash-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: …And Justice for All
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ae40917b-9ad5-4f05-9c6b-00695ee72900', '…And Justice for All',
        'Album', 'http://coverartarchive.org/release-group/67553e23-8dad-3792-b6f2-8fedd5650ff3/front',
        3924, 9, '1988-08-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heavy-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heavy-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('thrash-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'thrash-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Metallica
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c1ce9b78-3847-4592-b8c8-c5ac13986755', 'Metallica',
        'Album', 'http://coverartarchive.org/release-group/e8f70201-8899-3f0c-9e07-5d6495bc8046/front',
        3757, 12, '1991-08-12','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('heavy-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'heavy-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hard-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hard-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('thrash-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'thrash-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Cody Johnson
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('de1b9efb-f95d-48b6-a865-1165b6151e18', 'Cody Johnson', 'Country Music Singer', 'https://placehold.co/400?text=Cody%20Johnson', 'https://open.spotify.com/artist/6zLBxLdl60ekBLpawtT63I','https://music.apple.com/us/artist/331459657', NULL, 'United States', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Six Strings One Dream
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'add50d5d-df31-4f23-8bcd-ea38e066fb59', 'Six Strings One Dream',
        'Album', 'http://coverartarchive.org/release-group/4c3a2f5e-2469-4833-832e-606c170aeab3/front',
        2318, 10, '2009-09-01','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Black and White Label
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'e3c32aa1-6b33-4be9-b3da-9dcaf6d44ccb', 'Black and White Label',
        'Album', 'http://coverartarchive.org/release-group/73be0738-ef4a-4bb1-b841-74472cb58143/front',
        3088, 13, '2011-05-03','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: A Different Day
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'b0e253cf-2d98-47e4-ac7f-af13be41767c', 'A Different Day',
        'Album', 'http://coverartarchive.org/release-group/f5984f21-1859-4e9d-8d07-6faaebfa05dd/front',
        3028, 13, '2011-10-31','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cowboy Like Me
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2f3637d3-ad0e-4cd7-8ee2-096b93403385', 'Cowboy Like Me',
        'Album', 'http://coverartarchive.org/release-group/2dba4f02-a7b5-4ff3-a415-c9dfc164f835/front',
        2903, 13, '2014-01-14','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Gotta Be Me
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd096bc10-141a-4c0d-98fb-bdc6466ecfc6', 'Gotta Be Me',
        'Album', 'http://coverartarchive.org/release-group/ec95c2b8-208f-45ef-be7f-0715d3f1bf86/front',
        3028, 14, '2016-08-05','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('country') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'country';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Radiohead
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('9d481741-0608-4768-af2c-b418427761c2', 'Radiohead', '', 'https://placehold.co/400?text=Radiohead', 'https://open.spotify.com/artist/4Z8W4fKeB5YxbusRsdQVPb','https://music.apple.com/gb/artist/657515', 'https://www.instagram.com/radiohead/', 'Abingdon-on-Thames', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('chamber-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'chamber-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('crossover-prog') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'crossover-prog';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('idm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'idm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('uk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'uk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indietronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indietronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('progressive-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'progressive-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ambient-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ambient-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('art-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vyrzukhisuc-artiest') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vyrzukhisuc-artiest';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britrock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britrock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('oxford') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'oxford';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Pablo Honey
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '279a385f-5541-4dd3-9cf4-ea18d0564307', 'Pablo Honey',
        'Album', 'http://coverartarchive.org/release-group/cd76f76b-ff15-3784-a71d-4da3078a6851/front',
        2531, 12, '1993-02-22','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('chamber-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'chamber-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('crossover-prog') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'crossover-prog';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('idm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'idm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('uk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'uk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indietronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indietronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('progressive-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'progressive-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ambient-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ambient-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('art-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vyrzukhisuc-artiest') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vyrzukhisuc-artiest';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britrock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britrock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('oxford') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'oxford';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Bends
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ac4a9b38-4bfd-4213-9057-1cdc93972fd5', 'The Bends',
        'Album', 'http://coverartarchive.org/release-group/b8048f24-c026-3398-b23a-b5e50716cbc7/front',
        3363, 14, '1994-11-29','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('chamber-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'chamber-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('crossover-prog') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'crossover-prog';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('idm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'idm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('uk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'uk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indietronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indietronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('progressive-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'progressive-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ambient-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ambient-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('art-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vyrzukhisuc-artiest') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vyrzukhisuc-artiest';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britrock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britrock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('oxford') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'oxford';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: OK Computer
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '299c2cdd-d8eb-4d3b-af36-878459a91861', 'OK Computer',
        'Album', 'http://coverartarchive.org/release-group/b1392450-e666-3926-a536-22c65f834433/front',
        3208, 12, '1997-05-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('chamber-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'chamber-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('crossover-prog') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'crossover-prog';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('idm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'idm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('uk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'uk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indietronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indietronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('progressive-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'progressive-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ambient-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ambient-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('art-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vyrzukhisuc-artiest') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vyrzukhisuc-artiest';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britrock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britrock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('oxford') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'oxford';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Kid A
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f33c95d1-f457-4bb9-8b46-a958c672dbaf', 'Kid A',
        'Album', 'http://coverartarchive.org/release-group/e75c0549-ad55-39e3-8025-c72c5d4a3c5d/front',
        3049, 11, '2000-08-03','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('chamber-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'chamber-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('crossover-prog') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'crossover-prog';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('idm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'idm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('uk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'uk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indietronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indietronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('progressive-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'progressive-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ambient-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ambient-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('art-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vyrzukhisuc-artiest') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vyrzukhisuc-artiest';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britrock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britrock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('oxford') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'oxford';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Amnesiac
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '215eaeb5-1b53-497a-a326-fe9db1676853', 'Amnesiac',
        'Album', 'http://coverartarchive.org/release-group/bca9280e-28b4-327f-8fe0-fd918579e486/front',
        2635, 11, '2001-06-04','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('art-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('chamber-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'chamber-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('crossover-prog') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'crossover-prog';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('idm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'idm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('experimental-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'experimental-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('uk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'uk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indietronica') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indietronica';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('progressive-rock-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'progressive-rock-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('ambient-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'ambient-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('art-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'art-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('british') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'british';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-edm') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-edm';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('vyrzukhisuc-artiest') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'vyrzukhisuc-artiest';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('britrock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'britrock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('oxford') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'oxford';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('english') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'english';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Chappell Roan
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('a6f730c7-d34a-4a19-8161-eb070e550b08', 'Chappell Roan', '', 'https://placehold.co/400?text=Chappell%20Roan', 'https://open.spotify.com/artist/7GlBOeep6PqTfFi59PTUUN','https://music.apple.com/us/artist/1264818718', 'https://www.instagram.com/chappellroan/', 'Willard', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('queer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'queer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gay-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gay-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Rise and Fall of a Midwest Princess
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'cafefd18-657e-41cf-83ef-62d2a9e93afe', 'The Rise and Fall of a Midwest Princess',
        'Album', 'http://coverartarchive.org/release-group/eda0f5d3-44eb-42cf-bcfd-5c9f93e05c7a/front',
        2948, 14, '2023-09-22','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alternative-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('indie-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'indie-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('queer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'queer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('gay-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'gay-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('singer-songwriter') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'singer-songwriter';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Fetty Wap
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('e0ccc902-3fa5-4519-a252-ebf00a3b21df', 'Fetty Wap', 'American rapper, singer, and songwriter', 'https://placehold.co/400?text=Fetty%20Wap', 'https://open.spotify.com/artist/6PXS4YHDkKvl1wkIl4V8DL','https://music.apple.com/us/artist/872900424', 'https://www.instagram.com/fettywap1738/', 'Paterson', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Fetty Wap
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9e2444d5-06c1-414d-8e3e-a371817f14f2', 'Fetty Wap',
        'Album', 'http://coverartarchive.org/release-group/b795b26b-5c11-48f9-b82b-8371dd316504/front',
        3867, 17, '2015-09-25','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: For My Fans III: The Final Chapter
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '1e5219ff-46b3-4a49-9f8f-3bba2b713828', 'For My Fans III: The Final Chapter',
        'Album', 'http://coverartarchive.org/release-group/cd9ae514-e35f-434e-8e8b-90d1a4e13852/front',
        2463, 12, '2018-01-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: You Know the Vibes
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '42dbbf1c-4ea8-4d66-bf57-ef14542315c8', 'You Know the Vibes',
        'Album', 'http://coverartarchive.org/release-group/421566f2-e0cd-4960-a4e8-8b60080aac85/front',
        2494, 14, '2020-12-11','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Butterfly Effect
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c7a3d83c-bd62-4b3c-ba17-6e66e47c3544', 'The Butterfly Effect',
        'Album', 'http://coverartarchive.org/release-group/30c9aa66-073a-461c-873d-4aa718835916/front',
        2429, 17, '2021-10-22','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: King Zoo
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c5a35cc6-6017-47ff-85db-7a77b51b55af', 'King Zoo',
        'Album', 'http://coverartarchive.org/release-group/25d82397-d00f-4353-927f-d76dbf81b065/front',
        2658, 17, '2023-11-23','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Ariana Grande
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('d9c4d203-87f1-468b-9be1-b719a3e33355', 'Ariana Grande', '', 'https://placehold.co/400?text=Ariana%20Grande', 'https://artists.spotify.com/songwriter/1NvoC46GArJupRi8LtGB8Y','https://music.apple.com/us/artist/412778295', 'https://www.instagram.com/arianagrande/', 'Boca Raton', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Yours Truly
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'da414528-2d33-4fa6-887c-0c0b4d3e837a', 'Yours Truly',
        'Album', 'http://coverartarchive.org/release-group/1237b040-fb8f-4f23-8000-fb6909486c83/front',
        2784, 12, '2013-08-30','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: My Everything
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '92660631-a314-4062-9f88-dc964c1a6796', 'My Everything',
        'Album', 'http://coverartarchive.org/release-group/17fd3576-b584-4f32-8ff0-12206d4cb66c/front',
        3057, 15, '2014-08-22','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Dangerous Woman
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '14be39d8-3852-4a69-936d-e765b48f1415', 'Dangerous Woman',
        'Album', 'http://coverartarchive.org/release-group/dfd582da-ab2e-4009-9365-405bf1ad2c49/front',
        2378, 11, '2016-05-20','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Sweetener
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9aaabfaa-926c-4ae5-bbaf-2e93397adff6', 'Sweetener',
        'Album', 'http://coverartarchive.org/release-group/58afd5f5-a3cb-43c4-a0dc-fd15fbfe33bf/front',
        2849, 15, '2018-08-17','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: thank u, next
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '5a432260-6f6f-4d3f-b562-b3e5f4751db6', 'thank u, next',
        'Album', 'http://coverartarchive.org/release-group/485d3241-ef02-49a4-88df-a03eaa86d9cd/front',
        2464, 12, '2019-02-07','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trap-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trap-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Michael Jackson
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('64e72a12-591a-44e8-be74-2d7b13f96289', 'Michael Jackson', '“King of Pop”', 'https://placehold.co/400?text=Michael%20Jackson', 'https://open.spotify.com/artist/3fMbdgg4jU18AjLCKBhRSm','https://music.apple.com/za/artist/32940', 'https://www.instagram.com/michaeljackson/', 'Gary', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boogie') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boogie';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-jack-swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-jack-swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Got to Be There
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'ddaa528e-b7dd-4aa9-bf00-39ac1bde8773', 'Got to Be There',
        'Album', 'http://coverartarchive.org/release-group/97e0014d-a267-33a0-a868-bb4e2552918a/front',
        2133, 10, '1972-01-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boogie') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boogie';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-jack-swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-jack-swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Ben
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '83fd1420-9d98-4c01-bf83-14554c054e0b', 'Ben',
        'Album', 'http://coverartarchive.org/release-group/51343255-0ad3-3635-9aa2-548ba939b23e/front',
        1886, 10, '1972-08-04','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boogie') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boogie';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-jack-swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-jack-swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Music & Me
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'd7125290-829e-4c11-b247-89359c431264', 'Music & Me',
        'Album', 'http://coverartarchive.org/release-group/06b064b9-01e7-32d8-b585-86404584e795/front',
        1918, 10, '1973-04-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boogie') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boogie';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-jack-swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-jack-swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Forever, Michael
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '17d5e060-8487-46f8-ab35-71ed350a8063', 'Forever, Michael',
        'Album', 'http://coverartarchive.org/release-group/50b9d7de-9124-33c0-83a3-76722bf346e5/front',
        2002, 10, '1975-01-16','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boogie') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boogie';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-jack-swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-jack-swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Off the Wall
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0e046238-7e76-4dfc-8bfc-04f5754de7a1', 'Off the Wall',
        'Album', 'http://coverartarchive.org/release-group/ee749c63-5699-38e0-b565-7e84414648d9/front',
        2547, 10, '1979-08-10','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('contemporary-rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'contemporary-rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('boogie') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'boogie';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rb') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rb';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('post-disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('cultural-icon') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'cultural-icon';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('hip-hop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'hip-hop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('disco') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'disco';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rap') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rap';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-soul') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-soul';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('new-jack-swing') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'new-jack-swing';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Linkin Park
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('b1fe3c7b-7d6c-449d-b537-941039ded9b9', 'Linkin Park', 'American rock band', 'https://placehold.co/400?text=Linkin%20Park', 'https://open.spotify.com/artist/6XyY86QOPPrYVGvF9ch6wz','https://music.apple.com/us/artist/148662', 'https://www.instagram.com/linkinpark/', 'Agoura Hills', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('alt-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Hybrid Theory
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'bcee00a5-1997-4f90-8012-9e8d4396efc5', 'Hybrid Theory',
        'Album', 'http://coverartarchive.org/release-group/b5b4bb4b-8ba5-3acf-88cb-4cae2699d8da/front',
        2271, 12, '2000-05-07','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alt-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Meteora
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '3c5d7014-2589-42ff-bbd8-5d4d6788370e', 'Meteora',
        'Album', 'http://coverartarchive.org/release-group/09474d62-17dd-3a4f-98fb-04c65f38a479/front',
        2201, 13, '2003-03-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alt-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Minutes to Midnight
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '1783362a-697a-4b77-b1c5-250b9ecfc094', 'Minutes to Midnight',
        'Album', 'http://coverartarchive.org/release-group/a4201f5c-f0d7-319c-ba9d-ba0bac38da7a/front',
        2609, 12, '2007-05-11','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alt-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: A Thousand Suns
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '257b7a75-fdb2-40b3-ae71-04ab28c7b1cb', 'A Thousand Suns',
        'Album', 'http://coverartarchive.org/release-group/65404106-2976-4f98-a0e2-4e76923ea06d/front',
        2875, 15, '2010-09-08','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alt-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Living Things
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '2e5eb31d-348c-4edf-bbd3-f87a8d1f79ad', 'Living Things',
        'Album', 'http://coverartarchive.org/release-group/af682b63-021e-4806-afac-9aa4380fc6bd/front',
        2469, 13, '2012-06-20','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('alt-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alt-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rap-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rap-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('nu-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'nu-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Nirvana
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('1871cd35-4991-46ea-95e0-a9865fa94a14', 'Nirvana', '1980s–1990s US grunge band', 'https://placehold.co/400?text=Nirvana', 'https://open.spotify.com/artist/6olE6TJLqED3rqDCT0FyPh','https://music.apple.com/us/artist/112018', 'https://www.instagram.com/nirvana/', 'Aberdeen', 'Group')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('post-hardcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-hardcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('noise-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'noise-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('90s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '90s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('seattle') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'seattle';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('united-states') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'united-states';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pigfuck') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pigfuck';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('usa') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'usa';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('sludge-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'sludge-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('estados-unidos') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'estados-unidos';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acoustic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acoustic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Bleach
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '6bf15678-f8e5-444e-92ba-7fbe68dc4e5d', 'Bleach',
        'Album', 'http://coverartarchive.org/release-group/f1afec0b-26dd-3db5-9aa1-c91229a74a24/front',
        2238, 11, '1989-08-08','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('post-hardcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-hardcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('noise-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'noise-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('90s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '90s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('seattle') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'seattle';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('united-states') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'united-states';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pigfuck') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pigfuck';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('usa') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'usa';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('sludge-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'sludge-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('estados-unidos') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'estados-unidos';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acoustic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acoustic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Nevermind
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '0f928040-cc6b-48ba-b5c5-ad382986cd8b', 'Nevermind',
        'Album', 'http://coverartarchive.org/release-group/1b022e01-4da6-387b-8658-8678046e4cef/front',
        2557, 12, '1991-09-24','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('post-hardcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-hardcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('noise-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'noise-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('90s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '90s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('seattle') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'seattle';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('united-states') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'united-states';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pigfuck') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pigfuck';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('usa') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'usa';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('sludge-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'sludge-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('estados-unidos') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'estados-unidos';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acoustic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acoustic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: In Utero
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'de407354-6686-4a23-b705-cf94b7f5b206', 'In Utero',
        'Album', 'http://coverartarchive.org/release-group/2a0981fb-9593-3019-864b-ce934d97a16e/front',
        2482, 12, '1993-09-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('post-hardcore') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'post-hardcore';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('noise-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'noise-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('90s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '90s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('seattle') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'seattle';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('united-states') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'united-states';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('punk-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'punk-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pigfuck') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pigfuck';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('usa') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'usa';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('sludge-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'sludge-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('estados-unidos') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'estados-unidos';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('american') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'american';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('acoustic-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'acoustic-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('alternative-metal') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'alternative-metal';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('grunge') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'grunge';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Leon Thomas
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('77dac05a-a3a0-4961-8d6c-614d161ecd89', 'Leon Thomas', 'composer, “Two Steps From Hell” co‐founder', 'https://placehold.co/400?text=Leon%20Thomas', 'https://open.spotify.com/artist/6BF0bXbsdujMSMeFZBGcBq','https://music.apple.com/us/artist/377018847', 'https://www.instagram.com/thomasbergersenofficial/', 'Trondheim', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('composer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'composer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('orchestral') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'orchestral';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trailer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trailer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Illusions
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'c1758be2-3ea3-4a14-87e1-10f37674a920', 'Illusions',
        'Album', 'http://coverartarchive.org/release-group/cfc58220-c22a-4c0c-a56b-3185254df19e/front',
        4772, 19, '2011-06-22','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('composer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'composer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('orchestral') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'orchestral';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trailer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trailer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Sun
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f99a0d8a-e405-4bac-982e-2edecb44bc7d', 'Sun',
        'Album', 'http://coverartarchive.org/release-group/9dfab59f-4f80-4d9f-a41d-c2eec36e14d1/front',
        4217, 16, '2014-09-30','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('composer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'composer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('orchestral') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'orchestral';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trailer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trailer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: American Dream
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '3289ea94-e577-4412-9803-8ffb456e6641', 'American Dream',
        'Album', 'http://coverartarchive.org/release-group/fb58b959-2de2-4e25-96df-2a012602ffb2/front',
        5280, 19, '2018-07-31','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('composer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'composer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('orchestral') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'orchestral';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trailer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trailer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Seven
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '10debb58-a2cd-4e34-ab6d-11b15b229ca7', 'Seven',
        'Album', 'http://coverartarchive.org/release-group/ea4c91a3-4865-4324-a00b-5845f3c37ed9/front',
        3431, 7, '2019-07-07','Unknown')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('composer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'composer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('orchestral') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'orchestral';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trailer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trailer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Catch Me
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '19084c72-aaf6-4c12-953e-743e25395f9b', 'Catch Me',
        'Album', 'http://coverartarchive.org/release-group/393a3752-32ac-4aa2-9565-cd438b1dfeac/front',
        6479, 25, '2020-03-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('composer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'composer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('orchestral') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'orchestral';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('trailer') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'trailer';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic-music') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic-music';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('epic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'epic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

DO $$
DECLARE
    v_art_id bigint;
    v_alb_id bigint;
    v_gen_id bigint;
BEGIN
    -- Insert Artist: Lady Gaga
    INSERT INTO artists (art_uid, name, description,
        img_url, spotify_url, apple_url, insta_url,
        home_town, type)
   VALUES ('2dc7e7d8-4988-4fba-a730-8b01abf046a4', 'Lady Gaga', '', 'https://placehold.co/400?text=Lady%20Gaga', 'https://open.spotify.com/user/ladygaga_spotify','https://music.apple.com/us/artist/277293880', 'https://www.instagram.com/ladygaga/', 'Upper East Side', 'Person')
    RETURNING art_id INTO v_art_id;

    -- Artist Genres
    INSERT INTO genres (name) VALUES ('americana') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'americana';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('industrial-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'industrial-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('film-soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'film-soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synthpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synthpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO artists_x_genres (
            art_id, gen_id
        ) VALUES (
            v_art_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: The Fame
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '9490cf4b-e83b-48c5-bd24-0b767600047e', 'The Fame',
        'Album', 'http://coverartarchive.org/release-group/e5495719-b3ad-3eea-a533-fb70af43c23d/front',
        2550, 12, '2008-08-19','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('americana') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'americana';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('industrial-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'industrial-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('film-soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'film-soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synthpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synthpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Born This Way
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '38c935da-3ce4-4a88-9ab2-88925b20de2a', 'Born This Way',
        'Album', 'http://coverartarchive.org/release-group/2e3b231b-ab9f-4d85-950a-48708a1cc2fb/front',
        6353, 23, '2011-05-20','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('americana') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'americana';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('industrial-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'industrial-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('film-soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'film-soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synthpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synthpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: ARTPOP
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'f16b9cb3-8f05-4f01-8385-90c833672b69', 'ARTPOP',
        'Album', 'http://coverartarchive.org/release-group/815b31d8-b972-48a7-b74a-38c49a277676/front',
        7977, 24, '2013-11-05','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('americana') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'americana';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('industrial-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'industrial-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('film-soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'film-soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synthpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synthpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Cheek to Cheek
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        '20ebb3ef-e0bf-4476-909d-ed0e88d93ce2', 'Cheek to Cheek',
        'Album', 'http://coverartarchive.org/release-group/7815e9a2-4a1c-4bf3-b8d3-48a794090218/front',
        2088, 11, '2014-09-13','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('americana') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'americana';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('industrial-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'industrial-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('film-soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'film-soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synthpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synthpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

    -- Album: Joanne
    INSERT INTO albums (
        alb_uid, name, description, cover_url,
        duration, n_of_songs, rel_date, prim_lang
    )
    VALUES (
        'a429a0ec-dd85-4a71-95f6-d73d97319010', 'Joanne',
        'Album', 'http://coverartarchive.org/release-group/b3d4aef6-749f-40c1-b8f0-e763bde8cfdc/front',
        2346, 11, '2016-10-21','eng')
    RETURNING alb_id INTO v_alb_id;
    INSERT INTO artists_x_albums (
        art_id, alb_id
    ) VALUES (
        v_art_id, v_alb_id
    );
    INSERT INTO genres (name) VALUES ('americana') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'americana';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('pop-rock') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'pop-rock';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('industrial-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'industrial-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('jazz') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'jazz';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('film-soundtrack') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'film-soundtrack';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('late-2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'late-2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synth-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synth-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electro-house') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electro-house';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2010s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2010s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('synthpop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'synthpop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('adult-contemporary') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'adult-contemporary';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('female-vocals') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'female-vocals';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('dance-pop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'dance-pop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electropop') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electropop';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('millennial') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'millennial';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2000s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2000s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('2020s') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = '2020s';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;
    INSERT INTO genres (name) VALUES ('electronic') ON CONFLICT (name) DO NOTHING;
    SELECT gen_id INTO v_gen_id FROM genres WHERE name = 'electronic';
    IF v_gen_id IS NOT NULL THEN
        INSERT INTO albums_x_genres (
            alb_id, gen_id
        ) VALUES (
            v_alb_id, v_gen_id
        ) ON CONFLICT DO NOTHING;
    END IF;

END $$;

