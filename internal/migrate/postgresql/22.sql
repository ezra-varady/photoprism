CREATE TABLE IF NOT EXISTS links (
  link_uid bytea NOT NULL,
  share_uid bytea DEFAULT NULL,
  share_slug bytea DEFAULT NULL,
  link_token bytea DEFAULT NULL,
  link_expires int DEFAULT NULL,
  link_views bigint DEFAULT NULL,
  max_views bigint DEFAULT NULL,
  has_password boolean DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  modified_at timestamp DEFAULT NULL,
  comment varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  perm bigint DEFAULT NULL,
  ref_id bytea DEFAULT NULL,
  created_by bytea DEFAULT NULL,
  UNIQUE (share_uid, link_token),
  PRIMARY KEY (link_uid));
CREATE INDEX IF NOT EXISTS idx_links_uid_token on links (share_uid,link_token);
CREATE INDEX IF NOT EXISTS idx_links_share_slug on links (share_slug);
CREATE INDEX IF NOT EXISTS idx_links_created_by on links (created_by);