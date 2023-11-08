CREATE TABLE IF NOT EXISTS auth_users_shares (
  user_uid bytea NOT NULL,
  share_uid bytea NOT NULL,
  link_uid bytea DEFAULT NULL,
  expires_at timestamp DEFAULT NULL,
  comment varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  perm bigint DEFAULT NULL,
  ref_id bytea DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (user_uid,share_uid));
CREATE INDEX IF NOT EXISTS idx_auth_users_shares_expires_at on auth_users_shares (expires_at);
CREATE INDEX IF NOT EXISTS idx_auth_users_shares_share_uid on auth_users_shares (share_uid);