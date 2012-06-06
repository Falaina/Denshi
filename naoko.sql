-- WARNING: ANY CHANGES MADE TO THIS FILE MAY NEED TO BE REFLECTED IN database.py
-- SEE "DATABASE_UPGRADE" COMMENT IN database.py FOR MORE INFORMATION
-- Original Objects
CREATE TABLE videos(type TEXT, id TEXT, duration_ms INTEGER, title TEXT, primary key(type, id));
CREATE TABLE video_stats(type TEXT, id TEXT, uname TEXT, FOREIGN KEY(type, id) REFERENCES video(type, id));
CREATE INDEX video_stats_idx ON video_stats(type, id);
CREATE TABLE bans(reason TEXT, auth INTEGER, uname TEXT, timestamp INTEGER, mod TEXT);
CREATE TABLE user_count(timestamp INTEGER, count INTEGER, primary key(timestamp, count));

-- Added in dbversion 2
CREATE TABLE metadata(key TEXT, value TEXT, PRIMARY KEY(key));
CREATE TABLE chat(timestamp INTEGER, username TEXT, userid TEXT, msg TEXT, protocol TEXT, channel TEXT, flags TEXT);
CREATE INDEX chat_ts   ON chat(timestamp);
CREATE INDEX chat_user ON chat(username);

INSERT INTO metadata(key, value) VALUES ('dbversion', '2');

