CREATE TABLE IF NOT EXISTS files_sync (
  remote_name bytea NOT NULL,
  service_id SERIAL NOT NULL,
  file_id bigint DEFAULT NULL,
  remote_date timestamp DEFAULT NULL,
  remote_size bigint DEFAULT NULL,
  status bytea DEFAULT NULL,
  error bytea DEFAULT NULL,
  errors int DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (remote_name,service_id));
CREATE INDEX IF NOT EXISTS idx_files_sync_file_id on files_sync (file_id);