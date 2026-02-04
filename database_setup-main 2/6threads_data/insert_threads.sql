BEGIN;
INSERT INTO threads (t_id, t_uid, title, text, date_created, u_id, scene_id, likes, dislikes)
VALUES
(1, DEFAULT, 'Why I love Rock and Roll','I love Rock and Roll. Tell me why you guys love it also!', '2025-11-06 12:00:00', 2, 3, 10, 1),
(2, DEFAULT, 'Why I dont love Rock and Roll','I hate Rock and Roll. Tell me why you guys hate it also!', '2025-11-06 12:00:00', 4, 3, 2, 10),
(3, DEFAULT, 'Something 1','Some text about something 1', '2025-11-06 12:00:00', 11, 3, 20, 20),
(4, DEFAULT, 'Something 2','Some text about something 2', '2025-11-06 12:00:00', 9, 3, 0, 20);

COMMIT;
BEGIN;
INSERT INTO replies (rep_id, rep_uid, text, level, thread_id, parent_rep_id, u_id, date_created, likes, dislikes)
VALUES
(1, DEFAULT, 'I also like rock and roll', 1, 1, 1, 5, '2025-11-06 12:30:00', 0, 0),
(2, DEFAULT, 'I also again, like rock and roll', 1, 1, 1, 6, '2025-11-06 12:30:00', 0, 0),
(3, DEFAULT, 'I like it', 1, 1, 1, 7, '2025-11-06 12:30:00', 0, 0),
(4, DEFAULT, 'I agree', 2, 1, 1, 9, '2025-11-06 12:40:00', 0, 0),
(5, DEFAULT, 'I disagree', 3, 1, 1, 8, '2025-11-06 12:50:00', 0, 0),
(6, DEFAULT, 'I agree', 1, 2, 2, 6, '2025-11-06 12:30:00', 0, 0),
(7, DEFAULT, 'text', 1, 2, 2, 6, '2025-11-06 12:30:00', 0, 0),
(8, DEFAULT, 'text', 1, 2, 2, 10, '2025-11-06 12:30:00', 0, 0),
(9, DEFAULT, 'I agree', 1, 2, 2, 11, '2025-11-06 12:30:00', 0, 0),
(10, DEFAULT, 'I agree', 1, 2, 2, 6, '2025-11-06 12:30:00', 0, 0),
(11, DEFAULT, 'Rock never gets old.', 1, 3, 2, 3, '2025-11-06 13:00:00', 0, 0),
(12, DEFAULT, 'This is my favorite type of thread lol.', 1, 2, 1, 10, '2025-11-06 13:02:00', 0, 0),
(13, DEFAULT, 'Agree with you on that.', 2, 1, 1, 4, '2025-11-06 13:05:00', 0, 0),
(14, DEFAULT, 'Not sure I fully agree, but I get it.', 2, 2, 7, 8, '2025-11-06 13:08:00', 0, 0),
(15, DEFAULT, 'Replying deeper here.', 3, 1, 4, 6, '2025-11-06 13:10:00', 0, 0),
(16, DEFAULT, 'Yeah that makes sense.', 2, 3, 10, 11, '2025-11-06 13:12:00', 0, 0),
(17, DEFAULT, 'Honestly, same.', 1, 1, 3, 7, '2025-11-06 13:15:00', 0, 0),
(18, DEFAULT, 'I’m with you on this take.', 2, 2, 2, 9, '2025-11-06 13:18:00', 0, 0),
(19, DEFAULT, 'Going one level deeper—respectfully.', 3, 2, 5, 2, '2025-11-06 13:20:00', 0, 0),
(20, DEFAULT, 'Good point, I didn’t think of it that way.', 2, 3, 8, 1, '2025-11-06 13:25:00', 0, 0);
COMMIT;



