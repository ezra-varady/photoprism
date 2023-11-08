CREATE TABLE IF NOT EXISTS photos_users (
  uid bytea NOT NULL,
  user_uid bytea NOT NULL,
  team_uid bytea DEFAULT NULL,
  perm bigint DEFAULT NULL,
  PRIMARY KEY (uid,user_uid));
CREATE INDEX IF NOT EXISTS idx_photos_users_team_uid on photos_users (team_uid);
CREATE INDEX IF NOT EXISTS idx_photos_users_user_uid on photos_users (user_uid);