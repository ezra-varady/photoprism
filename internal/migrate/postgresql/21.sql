CREATE TABLE IF NOT EXISTS lenses (
  id SERIAL NOT NULL,
  lens_slug bytea DEFAULT NULL UNIQUE,
  lens_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  lens_make varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  lens_model varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  lens_type varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  lens_description varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  lens_notes varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS uix_lenses_lens_slug on lenses (lens_slug);
CREATE INDEX IF NOT EXISTS idx_lenses_deleted_at on lenses (deleted_at);