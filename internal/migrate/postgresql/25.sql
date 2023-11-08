CREATE TABLE IF NOT EXISTS passwords (
  uid bytea NOT NULL,
  hash bytea DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (uid)
);
