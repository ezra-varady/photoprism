CREATE TABLE IF NOT EXISTS folders (
  path bytea DEFAULT NULL,
  root bytea DEFAULT '',
  folder_uid bytea NOT NULL,
  folder_type bytea DEFAULT NULL,
  folder_title varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  folder_category varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  folder_description varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  folder_order bytea DEFAULT NULL,
  folder_country bytea DEFAULT 'zz',
  folder_year int DEFAULT NULL,
  folder_month int DEFAULT NULL,
  folder_day int DEFAULT NULL,
  folder_favorite boolean DEFAULT NULL,
  folder_private boolean DEFAULT NULL,
  folder_ignore boolean DEFAULT NULL,
  folder_watch boolean DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  modified_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  published_at timestamp DEFAULT NULL,
  UNIQUE (path, root),
  PRIMARY KEY (folder_uid));
CREATE INDEX IF NOT EXISTS idx_folders_path_root on folders (path,root);
CREATE INDEX IF NOT EXISTS idx_folders_folder_category on folders (folder_category);
CREATE INDEX IF NOT EXISTS idx_folders_country_year_month on folders (folder_country,folder_year,folder_month);
CREATE INDEX IF NOT EXISTS idx_folders_deleted_at on folders (deleted_at);
CREATE INDEX IF NOT EXISTS idx_folders_published_at on folders (published_at);