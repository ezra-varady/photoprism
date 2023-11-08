CREATE TABLE IF NOT EXISTS files (
  id SERIAL NOT NULL,
  photo_id bigint DEFAULT NULL,
  photo_uid bytea DEFAULT NULL,
  photo_taken_at timestamp DEFAULT NULL,
  time_index bytea DEFAULT NULL UNIQUE,
  media_id bytea DEFAULT NULL UNIQUE,
  media_utc bigint DEFAULT NULL,
  instance_id bytea DEFAULT NULL,
  file_uid bytea DEFAULT NULL UNIQUE,
  file_name varchar(1024) DEFAULT NULL,
  file_root varchar(1024) DEFAULT '/',
  original_name bytea DEFAULT NULL,
  file_hash bytea DEFAULT NULL,
  file_size bigint DEFAULT NULL,
  file_codec bytea DEFAULT NULL,
  file_type bytea DEFAULT NULL,
  media_type bytea DEFAULT NULL,
  file_mime bytea DEFAULT NULL,
  file_primary boolean DEFAULT NULL,
  file_sidecar boolean DEFAULT NULL,
  file_missing boolean DEFAULT NULL,
  file_portrait boolean DEFAULT NULL,
  file_video boolean DEFAULT NULL,
  file_duration bigint DEFAULT NULL,
  file_fps double precision DEFAULT NULL,
  file_frames int DEFAULT NULL,
  file_width int DEFAULT NULL,
  file_height int DEFAULT NULL,
  file_orientation int DEFAULT NULL,
  file_orientation_src bytea DEFAULT NULL,
  file_projection bytea DEFAULT NULL,
  file_aspect_ratio real DEFAULT NULL,
  file_hdr boolean DEFAULT NULL,
  file_watermark boolean DEFAULT NULL,
  file_color_profile bytea DEFAULT NULL,
  file_main_color bytea DEFAULT NULL,
  file_colors bytea DEFAULT NULL,
  file_luminance bytea DEFAULT NULL,
  file_diff int DEFAULT -1,
  file_chroma smallint DEFAULT -1,
  file_software varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  file_error bytea DEFAULT NULL,
  file_embedding real[] DEFAULT NULL,
  mod_time bigint DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  created_in bigint DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  updated_in bigint DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  published_at timestamp DEFAULT NULL,
  UNIQUE (file_name,file_root),
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS uix_files_file_uid on files (file_uid);
CREATE INDEX IF NOT EXISTS idx_files_name_root on files (file_name,file_root);
CREATE INDEX IF NOT EXISTS idx_files_search_media on files (media_id);
CREATE INDEX IF NOT EXISTS idx_files_search_timeline on files (time_index);
CREATE INDEX IF NOT EXISTS idx_files_instance_id on files (instance_id);
CREATE INDEX IF NOT EXISTS idx_files_file_hash on files (file_hash);
CREATE INDEX IF NOT EXISTS idx_files_file_main_color on files (file_main_color);
CREATE INDEX IF NOT EXISTS idx_files_deleted_at on files (deleted_at);
CREATE INDEX IF NOT EXISTS idx_files_photo_id on files (photo_id,file_primary);
CREATE INDEX IF NOT EXISTS idx_files_photo_uid on files (photo_uid);
CREATE INDEX IF NOT EXISTS idx_files_photo_taken_at on files (photo_taken_at);
CREATE INDEX IF NOT EXISTS idx_files_media_utc on files (media_utc);
CREATE INDEX IF NOT EXISTS idx_files_missing_root on files (file_missing,file_root);
CREATE INDEX IF NOT EXISTS idx_files_published_at on files (published_at);
