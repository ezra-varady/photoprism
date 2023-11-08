CREATE TABLE IF NOT EXISTS files_share (
  file_id SERIAL NOT NULL,
  service_id SERIAL NOT NULL,
  remote_name bytea NOT NULL,
  status bytea DEFAULT NULL,
  error bytea DEFAULT NULL,
  errors int DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (file_id,service_id,remote_name)
);
