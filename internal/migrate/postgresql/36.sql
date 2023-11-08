CREATE TABLE IF NOT EXISTS albums (
  id SERIAL NOT NULL,
  album_uid bytea DEFAULT NULL UNIQUE,
  parent_uid bytea DEFAULT '',
  album_slug bytea DEFAULT NULL,
  album_path bytea DEFAULT NULL,
  album_type bytea DEFAULT 'album',
  album_title varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_location varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_category varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_caption varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_description varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_notes varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_filter bytea DEFAULT '',
  album_order bytea DEFAULT NULL,
  album_template bytea DEFAULT NULL,
  album_state varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  album_country bytea DEFAULT 'zz',
  album_year int DEFAULT NULL,
  album_month int DEFAULT NULL,
  album_day int DEFAULT NULL,
  album_favorite boolean DEFAULT NULL,
  album_private boolean DEFAULT NULL,
  thumb bytea DEFAULT '',
  thumb_src bytea DEFAULT '',
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  created_by bytea DEFAULT NULL,
  published_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));

CREATE INDEX IF NOT EXISTS uix_albums_album_uid on albums (album_uid);
CREATE INDEX IF NOT EXISTS idx_albums_album_slug on albums (album_slug);
CREATE INDEX IF NOT EXISTS idx_albums_album_path on albums (album_path);
CREATE INDEX IF NOT EXISTS idx_albums_album_title on albums (album_title);
CREATE INDEX IF NOT EXISTS idx_albums_deleted_at on albums (deleted_at);
CREATE INDEX IF NOT EXISTS idx_albums_album_category on albums (album_category);
CREATE INDEX IF NOT EXISTS idx_albums_album_state on albums (album_state);
CREATE INDEX IF NOT EXISTS idx_albums_country_year_month on albums (album_country,album_year,album_month);
CREATE INDEX IF NOT EXISTS idx_albums_ymd on albums (album_day);
CREATE INDEX IF NOT EXISTS idx_albums_thumb on albums (thumb);
CREATE INDEX IF NOT EXISTS idx_albums_album_filter on albums (album_filter);
CREATE INDEX IF NOT EXISTS idx_albums_created_by on albums (created_by);
CREATE INDEX IF NOT EXISTS idx_albums_published_at on albums (published_at);
