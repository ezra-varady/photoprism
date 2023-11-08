CREATE TABLE IF NOT EXISTS reactions (
  uid bytea NOT NULL,
  user_uid bytea NOT NULL,
  reaction bytea NOT NULL,
  reacted int DEFAULT NULL,
  reacted_at timestamp DEFAULT NULL,
  PRIMARY KEY (uid,user_uid,reaction));
CREATE INDEX IF NOT EXISTS idx_reactions_reacted_at on reactions (reacted_at);