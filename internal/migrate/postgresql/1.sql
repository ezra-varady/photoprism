CREATE TABLE IF NOT EXISTS albums_users (
  uid bytea NOT NULL,
  user_uid bytea NOT NULL,
  team_uid bytea DEFAULT NULL,
  perm bigint DEFAULT NULL,
  PRIMARY KEY (uid,user_uid));
CREATE INDEX IF NOT EXISTS idx_albums_users_user_uid on albums_users (user_uid);
CREATE INDEX IF NOT EXISTS idx_albums_users_team_uid on albums_users (team_uid);