CREATE TABLE IF NOT EXISTS subjects (
  subj_uid bytea NOT NULL,
  subj_type bytea DEFAULT '',
  subj_src bytea DEFAULT '',
  subj_slug bytea DEFAULT '',
  subj_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT '' UNIQUE,
  subj_alias varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT '',
  subj_bio varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  subj_notes varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  subj_favorite boolean DEFAULT false,
  subj_hidden boolean DEFAULT false,
  subj_private boolean DEFAULT false,
  subj_excluded boolean DEFAULT true,
  file_count int DEFAULT 0,
  photo_count int DEFAULT 0,
  thumb bytea DEFAULT '',
  thumb_src bytea DEFAULT '',
  metadata_json bytea DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  PRIMARY KEY (subj_uid));
CREATE INDEX IF NOT EXISTS uix_subjects_subj_name on subjects (subj_name);
CREATE INDEX IF NOT EXISTS idx_subjects_subj_slug on subjects (subj_slug);
CREATE INDEX IF NOT EXISTS idx_subjects_thumb on subjects (thumb);
CREATE INDEX IF NOT EXISTS idx_subjects_deleted_at on subjects (deleted_at);
