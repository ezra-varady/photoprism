CREATE TABLE IF NOT EXISTS services (
  id SERIAL NOT NULL,
  acc_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  acc_owner varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  acc_url varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  acc_type bytea DEFAULT NULL,
  acc_key bytea DEFAULT NULL,
  acc_user bytea DEFAULT NULL,
  acc_pass bytea DEFAULT NULL,
  acc_timeout bytea DEFAULT NULL,
  acc_error bytea DEFAULT NULL,
  acc_errors int DEFAULT NULL,
  acc_share boolean DEFAULT NULL,
  acc_sync boolean DEFAULT NULL,
  retry_limit int DEFAULT NULL,
  share_path bytea DEFAULT NULL,
  share_size bytea DEFAULT NULL,
  share_expires int DEFAULT NULL,
  sync_path bytea DEFAULT NULL,
  sync_status bytea DEFAULT NULL,
  sync_interval int DEFAULT NULL,
  sync_date timestamp DEFAULT NULL,
  sync_upload boolean DEFAULT NULL,
  sync_download boolean DEFAULT NULL,
  sync_filenames boolean DEFAULT NULL,
  sync_raw boolean DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS idx_accounts_deleted_at on services (deleted_at);
CREATE INDEX IF NOT EXISTS idx_services_deleted_at on services (deleted_at);