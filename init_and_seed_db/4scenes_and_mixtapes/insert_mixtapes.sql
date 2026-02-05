BEGIN;

INSERT INTO mixtapes (mix_uid, name, description, is_official, owner_id, priv_st_id)
VALUES
(DEFAULT, 'The Drake Mixtape', 'My favourite Drake albums', false, 3, 300),
(DEFAULT, 'Greatest Albums Ever', 'Official Mixtape of the most popular albums', true, 11, 200),
(DEFAULT, 'Cozy playlist', '', false, 4, 400);

INSERT INTO mixtapes_x_albums (mx_id, alb_id, position)
VALUES
(1, 57, 3), (1, 58, 2), (1, 59, 1), (1, 60, 5), (1, 61, 4),
(2, 9, 1), (2, 68, 2),(2, 69, 3), (2, 83, 4), (2, 91, 5), (2, 135, 6),
(3, 197, 1), (3, 170, 2), (3, 18, 3), (3, 33, 4);

COMMIT;