CREATE TABLE IF NOT EXISTS keywords (
  id SERIAL NOT NULL,
  keyword varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  skip boolean DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS idx_keywords_keyword on keywords (keyword);