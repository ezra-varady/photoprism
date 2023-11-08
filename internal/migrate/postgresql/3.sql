CREATE TABLE IF NOT EXISTS auth_users (
  id int NOT NULL,
  user_uuid bytea DEFAULT NULL,
  user_uid bytea DEFAULT NULL UNIQUE,
  auth_provider bytea DEFAULT '',
  auth_id bytea DEFAULT '',
  user_name varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  display_name varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  user_email varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  backup_email varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  user_role varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  user_attr varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  super_admin boolean DEFAULT NULL,
  can_login boolean DEFAULT NULL,
  login_at timestamp DEFAULT NULL,
  expires_at timestamp DEFAULT NULL,
  webdav boolean DEFAULT NULL,
  base_path bytea DEFAULT NULL,
  upload_path bytea DEFAULT NULL,
  can_invite boolean DEFAULT NULL,
  invite_token bytea DEFAULT NULL,
  invited_by varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  verify_token bytea DEFAULT NULL,
  verified_at timestamp DEFAULT NULL,
  consent_at timestamp DEFAULT NULL,
  born_at timestamp DEFAULT NULL,
  reset_token bytea DEFAULT NULL,
  preview_token bytea DEFAULT NULL,
  download_token bytea DEFAULT NULL,
  thumb bytea DEFAULT '',
  thumb_src bytea DEFAULT '',
  ref_id bytea DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  deleted_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS uix_auth_users_user_uid on auth_users (user_uid);
CREATE INDEX IF NOT EXISTS idx_auth_users_user_uuid on auth_users (user_uuid);
CREATE INDEX IF NOT EXISTS idx_auth_users_user_email on auth_users (user_email);
CREATE INDEX IF NOT EXISTS idx_auth_users_expires_at on auth_users (expires_at);
CREATE INDEX IF NOT EXISTS idx_auth_users_born_at on auth_users (born_at);
CREATE INDEX IF NOT EXISTS idx_auth_users_deleted_at on auth_users (deleted_at);
CREATE INDEX IF NOT EXISTS idx_auth_users_auth_id on auth_users (auth_id);
CREATE INDEX IF NOT EXISTS idx_auth_users_user_name on auth_users (user_name);
CREATE INDEX IF NOT EXISTS idx_auth_users_invite_token on auth_users (invite_token);
CREATE INDEX IF NOT EXISTS idx_auth_users_thumb on auth_users (thumb);