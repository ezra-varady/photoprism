CREATE TABLE IF NOT EXISTS photos_albums (
  photo_uid bytea NOT NULL,
  album_uid bytea NOT NULL,
  "order" int DEFAULT NULL,
  hidden boolean DEFAULT NULL,
  missing boolean DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (photo_uid,album_uid));
CREATE INDEX IF NOT EXISTS idx_photos_albums_album_uid on photos_albums (album_uid);
