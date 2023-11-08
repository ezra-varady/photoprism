CREATE TABLE IF NOT EXISTS duplicates (
  file_name bytea NOT NULL,
  file_root bytea NOT NULL DEFAULT '/',
  file_hash bytea DEFAULT '',
  file_size bigint DEFAULT NULL,
  mod_time bigint DEFAULT NULL,
  PRIMARY KEY (file_name,file_root));
CREATE INDEX IF NOT EXISTS idx_duplicates_file_hash on duplicates (file_hash);