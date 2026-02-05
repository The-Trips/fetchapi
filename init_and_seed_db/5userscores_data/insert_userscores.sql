BEGIN;

INSERT INTO ratings (score, u_id, alb_id) VALUES
(5, 1, 205),
(5, 2, 205),
(5, 3, 205),
(5, 4, 205),
(5, 5, 205),
(5, 6, 205),
(5, 7, 205),
(5, 8, 205),
(5, 9, 205),
(4, 10, 205),
(4, 11, 205),
(4, 1, 206),
(4, 2, 206),
(4, 3, 206),
(4, 4, 206),
(3, 5, 206),
(3, 6, 206),
(3, 7, 206),
(3, 8, 206),
(3, 9, 206),
(2, 10, 206),
(4, 11, 206),
(2, 1, 207),
(2, 2, 207),
(2, 3, 207),
(2, 4, 207),
(1, 5, 207),
(1, 6, 207),
(1, 7, 207),
(1, 8, 207),
(1, 9, 207),
(1, 10, 207),
(3, 11, 207);

INSERT INTO reviews (rv_uid, text, u_id, alb_id, date_created, date_updated) VALUES
(DEFAULT, 'Instant classic. Every track feels polished, and the hooks get stuck in your head all day.', 1, 205, '2025-11-06 12:00:00', '2025-11-06 12:00:00'),
(DEFAULT, 'The production is insane—super clean, big energy, and the sequencing flows really well.', 2, 205, '2025-11-07 12:00:00', '2025-11-07 12:00:00'),
(DEFAULT, 'Did not expect to like it this much. Strong vocals, strong writing, and zero skips for me.', 3, 205, '2025-11-08 12:00:00', '2025-11-08 12:00:00'),
(DEFAULT, 'High replay value. I keep coming back to the same few songs—they just hit.', 4, 205, '2025-11-09 12:00:00', '2025-11-09 12:00:00'),
(DEFAULT, 'Great album for late-night listening. The vibe is consistent and the highlights are huge.', 5, 205, '2025-11-10 12:00:00', '2025-11-10 12:00:00'),
(DEFAULT, 'This feels like a full project, not just a playlist. The themes and transitions are really solid.', 6, 205, '2025-11-11 12:00:00', '2025-11-11 12:00:00'),
(DEFAULT, 'A few tracks stand out as all-timers. Even the weaker songs are still enjoyable.', 7, 205, '2025-11-12 12:00:00', '2025-11-12 12:00:00'),
(DEFAULT, 'Love the variety without losing the identity. It stays focused but never gets boring.', 8, 205, '2025-11-13 12:00:00', '2025-11-13 12:00:00'),
(DEFAULT, 'The melodies are crazy good. It’s catchy, emotional, and well-produced from start to finish.', 9, 205, '2025-11-14 12:00:00', '2025-11-14 12:00:00'),
(DEFAULT, 'Not perfect, but still excellent. A couple songs drag slightly, but overall it’s a strong listen.', 10, 205, '2025-11-15 12:00:00', '2025-11-15 12:00:00'),
(DEFAULT, 'Top-tier album. The best moments are unbelievable, and it holds up after multiple listens.', 11, 205, '2025-11-16 12:00:00', '2025-11-16 12:00:00');

INSERT INTO user_moods (mood_id, u_id, alb_id) VALUES
(1, 1, 205),   -- energetic
(7, 1, 205),   -- euphoric
(33, 1, 205),  -- epic
(46, 1, 205),  -- sexy
(34, 1, 205),  -- cinematic
(8, 2, 205),   -- uplifting
(31, 2, 205),  -- confident
(32, 2, 205),  -- powerful
(45, 2, 205),  -- groovy
(49, 2, 205),  -- cool
(6, 3, 205),   -- joyful
(5, 3, 205),   -- happy
(36, 3, 205),  -- triumphant
(37, 3, 205),  -- motivational
(41, 3, 205),  -- playful
(46, 4, 205),  -- sexy
(47, 4, 205),  -- sensual
(48, 4, 205),  -- smooth
(10, 4, 205),  -- romantic
(44, 4, 205),  -- funky
(7, 5, 205),   -- euphoric
(8, 5, 205),   -- uplifting
(9, 5, 205),   -- hopeful
(35, 5, 205),  -- dramatic
(34, 5, 205),  -- cinematic
(1, 6, 205),   -- energetic
(42, 6, 205),  -- fun
(45, 6, 205),  -- groovy
(49, 6, 205),  -- cool
(31, 6, 205),  -- confident
(33, 7, 205),  -- epic
(34, 7, 205),  -- cinematic
(32, 7, 205),  -- powerful
(36, 7, 205),  -- triumphant
(25, 7, 205),  -- intense
(5, 8, 205),   -- happy
(6, 8, 205),   -- joyful
(7, 8, 205),   -- euphoric
(8, 8, 205),   -- uplifting
(45, 8, 205),  -- groovy
(46, 9, 205),  -- sexy
(47, 9, 205),  -- sensual
(48, 9, 205),  -- smooth
(49, 9, 205),  -- cool
(50, 9, 205),  -- laid-back
(1, 10, 205),  -- energetic
(31, 10, 205), -- confident
(37, 10, 205), -- motivational
(38, 10, 205), -- focused
(33, 10, 205), -- epic
(7, 11, 205),  -- euphoric
(34, 11, 205), -- cinematic
(35, 11, 205), -- dramatic
(44, 11, 205), -- funky
(42, 11, 205), -- fun
(44, 1, 205),  -- funky
(45, 4, 205),  -- groovy
(42, 2, 205),  -- fun
(41, 5, 205),  -- playful
(48, 6, 205);  -- smooth

COMMIT;