CREATE TABLE IF NOT EXISTS auth_sessions (
  id bytea NOT NULL,
  client_ip varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  user_uid bytea DEFAULT '',
  user_name varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  auth_provider bytea DEFAULT '',
  auth_method bytea DEFAULT '',
  auth_domain bytea DEFAULT '',
  auth_id bytea DEFAULT '',
  auth_scope varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  last_active bigint DEFAULT NULL,
  sess_expires bigint DEFAULT NULL,
  sess_timeout bigint DEFAULT NULL,
  preview_token bytea DEFAULT '',
  download_token bytea DEFAULT '',
  access_token bytea DEFAULT '',
  refresh_token bytea DEFAULT '',
  id_token bytea DEFAULT '',
  user_agent varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  data_json bytea DEFAULT NULL,
  ref_id bytea DEFAULT '',
  login_ip varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  login_at timestamp DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS idx_auth_sessions_client_ip on auth_sessions (client_ip);
CREATE INDEX IF NOT EXISTS idx_auth_sessions_user_uid on auth_sessions (user_uid);
CREATE INDEX IF NOT EXISTS idx_auth_sessions_user_name on auth_sessions (user_name);
CREATE INDEX IF NOT EXISTS idx_auth_sessions_auth_id on auth_sessions (auth_id);
CREATE INDEX IF NOT EXISTS idx_auth_sessions_sess_expires on auth_sessions (sess_expires);