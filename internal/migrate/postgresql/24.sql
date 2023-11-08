CREATE TABLE IF NOT EXISTS migrations (
  id varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  dialect varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  error varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  source varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  started_at timestamp DEFAULT NULL,
  finished_at timestamp DEFAULT NULL,
  stage varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id)
);
