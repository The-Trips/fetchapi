BEGIN;

INSERT INTO scenes (scene_id, scene_uid, name, description, image_url, date_created, date_updated, official, owner_id, followers) VALUES (1, DEFAULT, 'Lady Gaga', 'Official scene of Lady Gaga for her fans', 'https://ichef.bbci.co.uk/news/480/cpsprodpb/197d/live/62057290-fa95-11ef-a24f-f97f794e18ea.jpg.webp', '2025-11-06 12:00:00', '2025-11-06 12:00:00', TRUE, 11, 0) ON CONFLICT (scene_id) DO UPDATE SET name=EXCLUDED.name, description=EXCLUDED.description, image_url=EXCLUDED.image_url, date_updated=EXCLUDED.date_updated, official=EXCLUDED.official, owner_id=EXCLUDED.owner_id, followers=EXCLUDED.followers;

INSERT INTO scenes (scene_id, scene_uid, name, description, image_url, date_created, date_updated, official, owner_id, followers) VALUES (2, DEFAULT, 'good kid maad city', 'Official scene of Kendric Lamar''s best album', 'https://cdn-images.dzcdn.net/images/cover/b5be27644d505bad7bdb516fe4165475/500x500.jpg', '2025-11-06 12:00:00', '2025-11-06 12:00:00', TRUE, 11, 0) ON CONFLICT (scene_id) DO UPDATE SET name=EXCLUDED.name, description=EXCLUDED.description, image_url=EXCLUDED.image_url, date_updated=EXCLUDED.date_updated, official=EXCLUDED.official, owner_id=EXCLUDED.owner_id, followers=EXCLUDED.followers;

INSERT INTO scenes (scene_id, scene_uid, name, description, image_url, date_created, date_updated, official, owner_id, followers) VALUES (3, DEFAULT, 'Rock and roll scene', 'Scene for all rock and roll fans', NULL, '2025-11-06 12:00:00', '2025-11-06 12:00:00', FALSE, 1, 0) ON CONFLICT (scene_id) DO UPDATE SET name=EXCLUDED.name, description=EXCLUDED.description, image_url=EXCLUDED.image_url, date_updated=EXCLUDED.date_updated, official=EXCLUDED.official, owner_id=EXCLUDED.owner_id, followers=EXCLUDED.followers;

COMMIT;
