CREATE TABLE IF NOT EXISTS countries (
  id bytea NOT NULL,
  country_slug bytea DEFAULT NULL UNIQUE,
  country_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  country_description varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  country_notes varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  country_photo_id bigint DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS uix_countries_country_slug on countries (country_slug);
