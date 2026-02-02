----------------------------------------------
-- add data to genres table
insert into genres (name) values
-- Classical & Art
('classical'),
('medieval'),
('renaissance'),
('baroque'),
('romantic'),
('modern-classical'),
('contemporary-classical'),
('opera'),
('chamber-music'),
('orchestral'),

-- Jazz
('jazz'),
('dixieland'),
('swing'),
('bebop'),
('cool-jazz'),
('free-jazz'),
('jazz-fusion'),
('latin-jazz'),
('smooth-jazz'),

-- Rock
('rock'),
('classic-rock'),
('hard-rock'),
('progressive-rock'),
('psychedelic-rock'),
('garage-rock'),
('indie-rock'),
('alternative-rock'),
('post-rock'),
('shoegaze'),

-- Metal
('heavy-metal'),
('thrash-metal'),
('death-metal'),
('black-metal'),
('doom-metal'),
('power-metal'),
('progressive-metal'),
('metalcore'),
('deathcore'),

-- Pop
('pop'),
('dance-pop'),
('synth-pop'),
('electropop'),
('indie-pop'),
('dream-pop'),
('hyperpop'),
('k-pop'),
('j-pop'),
('latin-pop'),

-- Electronic / EDM
('electronic'),
('house'),
('deep-house'),
('techno'),
('trance'),
('drum-and-bass'),
('dubstep'),
('ambient'),
('idm'),
('downtempo'),

-- Hip-Hop
('hip-hop'),
('rap'),
('boom-bap'),
('trap'),
('drill'),
('conscious-hip-hop'),
('alternative-hip-hop'),
('lo-fi-hip-hop'),

-- R&B / Soul / Funk
('rnb'),
('soul'),
('neo-soul'),
('funk'),
('disco'),

-- Blues
('blues'),
('delta-blues'),
('chicago-blues'),
('electric-blues'),

-- Country & Folk
('country'),
('americana'),
('bluegrass'),
('folk'),
('indie-folk'),

-- Latin
('salsa'),
('bachata'),
('reggaeton'),
('cumbia'),
('tango'),
('bossa-nova'),
('samba'),

-- Reggae & African
('reggae'),
('dub'),
('dancehall'),
('afrobeat'),
('afrobeats'),
('amapiano'),

-- Soundtrack & Misc
('film-score'),
('video-game-music'),
('anime-ost'),
('lo-fi'),
('chillhop'),
('vaporwave'),
('synthwave');

----------------------------------------------
-- add data to moods table
insert into moods (name) values
('energetic'),
('chill'),
('relaxed'),
('calm'),
('happy'),
('joyful'),
('euphoric'),
('uplifting'),
('hopeful'),
('romantic'),
('melancholic'),
('sad'),
('heartbroken'),
('emotional'),
('nostalgic'),
('reflective'),
('dreamy'),
('ethereal'),
('atmospheric'),
('ambient'),
('dark'),
('mysterious'),
('moody'),
('brooding'),
('intense'),
('aggressive'),
('angry'),
('raw'),
('gritty'),
('heavy'),
('confident'),
('powerful'),
('epic'),
('cinematic'),
('dramatic'),
('triumphant'),
('motivational'),
('focused'),
('meditative'),
('spiritual'),
('playful'),
('fun'),
('quirky'),
('funky'),
('groovy'),
('sexy'),
('sensual'),
('smooth'),
('cool'),
('laid-back');

----------------------------------------------
-- add data into privacy status
-- 3 options: public - everyone can see it
--            private - no one can see it execpt
--            friends_only - only user's friends can see
insert into privacy_status (priv_st_id, status_name) values
(200, 'public'),
(400, 'private'),
(300, 'friends_only');