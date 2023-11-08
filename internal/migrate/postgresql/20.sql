CREATE TABLE IF NOT EXISTS labels (
  id SERIAL NOT NULL,
  label_uid bytea DEFAULT NULL UNIQUE,
  label_slug bytea DEFAULT NULL UNIQUE,
  custom_slug bytea DEFAULT NULL,
  label_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  label_priority int DEFAULT NULL,
  label_favorite boolean DEFAULT NULL,
  label_description varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  label_notes varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  photo_count int DEFAULT 1,
  thumb bytea DEFAULT '',
  thumb_src bytea DEFAULT '',
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  published_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS uix_labels_label_slug on labels (label_slug);
CREATE INDEX IF NOT EXISTS uix_labels_label_uid on labels (label_uid);
CREATE INDEX IF NOT EXISTS idx_labels_custom_slug on labels (custom_slug);
CREATE INDEX IF NOT EXISTS idx_labels_thumb on labels (thumb);
CREATE INDEX IF NOT EXISTS idx_labels_deleted_at on labels (deleted_at);
CREATE INDEX IF NOT EXISTS idx_labels_published_at on labels (published_at);