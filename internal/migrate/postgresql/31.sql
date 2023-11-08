CREATE TABLE IF NOT EXISTS places (
  id bytea NOT NULL,
  place_label varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  place_district varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  place_city varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  place_state varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  place_country bytea DEFAULT NULL,
  place_keywords varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  place_favorite boolean DEFAULT NULL,
  photo_count int DEFAULT 1,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS idx_places_place_district on places (place_district);
CREATE INDEX IF NOT EXISTS idx_places_place_city on places (place_city);
CREATE INDEX IF NOT EXISTS idx_places_place_state on places (place_state);
