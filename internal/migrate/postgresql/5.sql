CREATE TABLE IF NOT EXISTS auth_users_settings (
  user_uid bytea NOT NULL,
  ui_theme bytea DEFAULT NULL,
  ui_language bytea DEFAULT NULL,
  ui_time_zone bytea DEFAULT NULL,
  maps_style bytea DEFAULT NULL,
  maps_animate int DEFAULT NULL,
  index_path bytea DEFAULT NULL,
  index_rescan int DEFAULT NULL,
  import_path bytea DEFAULT NULL,
  import_move int DEFAULT NULL,
  upload_path bytea DEFAULT NULL,
  default_page bytea DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (user_uid)
);
