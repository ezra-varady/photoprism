CREATE TABLE IF NOT EXISTS cameras (
  id SERIAL NOT NULL,
  camera_slug bytea DEFAULT NULL UNIQUE,
  camera_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  camera_make varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  camera_model varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  camera_type varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  camera_description varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  camera_notes varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS uix_cameras_camera_slug on cameras (camera_slug);
CREATE INDEX IF NOT EXISTS idx_cameras_deleted_at on cameras (deleted_at);