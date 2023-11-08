CREATE TABLE IF NOT EXISTS cells (
  id bytea NOT NULL,
  cell_name varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  cell_street varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  cell_postcode varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  cell_category varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  place_id bytea DEFAULT 'zz',
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (id)
);
