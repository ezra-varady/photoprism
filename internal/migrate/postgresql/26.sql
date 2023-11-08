CREATE TABLE IF NOT EXISTS photos (
  id SERIAL NOT NULL,
  uuid bytea DEFAULT NULL,
  taken_at timestamp DEFAULT NULL,
  taken_at_local timestamp DEFAULT NULL,
  taken_src bytea DEFAULT NULL,
  photo_uid bytea DEFAULT NULL UNIQUE,
  photo_type bytea DEFAULT 'image',
  type_src bytea DEFAULT NULL,
  photo_title varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  title_src bytea DEFAULT NULL,
  photo_description varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  description_src bytea DEFAULT NULL,
  photo_path bytea DEFAULT NULL,
  photo_name bytea DEFAULT NULL,
  original_name bytea DEFAULT NULL,
  photo_stack smallint DEFAULT NULL,
  photo_favorite boolean DEFAULT NULL,
  photo_private boolean DEFAULT NULL,
  photo_scan boolean DEFAULT NULL,
  photo_panorama boolean DEFAULT NULL,
  time_zone bytea DEFAULT NULL,
  place_id bytea DEFAULT 'zz',
  place_src bytea DEFAULT NULL,
  cell_id bytea DEFAULT 'zz',
  cell_accuracy int DEFAULT NULL,
  photo_altitude int DEFAULT NULL,
  photo_lat real DEFAULT NULL,
  photo_lng real DEFAULT NULL,
  photo_country bytea DEFAULT 'zz',
  photo_year int DEFAULT NULL,
  photo_month int DEFAULT NULL,
  photo_day int DEFAULT NULL,
  photo_iso int DEFAULT NULL,
  photo_exposure bytea DEFAULT NULL,
  photo_f_number real DEFAULT NULL,
  photo_focal_length int DEFAULT NULL,
  photo_quality smallint DEFAULT NULL,
  photo_faces int DEFAULT NULL,
  photo_resolution smallint DEFAULT NULL,
  photo_color smallint DEFAULT -1,
  camera_id bigint DEFAULT 1,
  camera_serial bytea DEFAULT NULL,
  camera_src bytea DEFAULT NULL,
  lens_id bigint DEFAULT 1,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  edited_at timestamp DEFAULT NULL,
  checked_at timestamp DEFAULT NULL,
  estimated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  photo_duration bigint DEFAULT NULL,
  created_by bytea DEFAULT NULL,
  published_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS uix_photos_photo_uid on photos (photo_uid);
CREATE INDEX IF NOT EXISTS idx_photos_path_name on photos (photo_path,photo_name);
CREATE INDEX IF NOT EXISTS idx_photos_cell_id on photos (cell_id);
CREATE INDEX IF NOT EXISTS idx_photos_photo_lat on photos (photo_lat);
CREATE INDEX IF NOT EXISTS idx_photos_photo_lng on photos (photo_lng);
CREATE INDEX IF NOT EXISTS idx_photos_country_year_month on photos (photo_country,photo_year,photo_month);
CREATE INDEX IF NOT EXISTS idx_photos_camera_lens on photos (camera_id,lens_id);
CREATE INDEX IF NOT EXISTS idx_photos_uuid on photos (uuid);
CREATE INDEX IF NOT EXISTS idx_photos_taken_uid on photos (taken_at,photo_uid);
CREATE INDEX IF NOT EXISTS idx_photos_checked_at on photos (checked_at);
CREATE INDEX IF NOT EXISTS idx_photos_deleted_at on photos (deleted_at);
CREATE INDEX IF NOT EXISTS idx_photos_place_id on photos (place_id);
CREATE INDEX IF NOT EXISTS idx_photos_ymd on photos (photo_day);
CREATE INDEX IF NOT EXISTS idx_photos_created_by on photos (created_by);
CREATE INDEX IF NOT EXISTS idx_photos_published_at on photos (published_at);
