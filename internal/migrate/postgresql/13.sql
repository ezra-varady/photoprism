CREATE TABLE IF NOT EXISTS errors (
  id SERIAL NOT NULL,
  error_time timestamp DEFAULT NULL,
  error_level bytea DEFAULT NULL,
  error_message bytea DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS idx_errors_error_time on errors (error_time);