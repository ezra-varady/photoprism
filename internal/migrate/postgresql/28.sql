CREATE TABLE IF NOT EXISTS photos_keywords (
  photo_id SERIAL NOT NULL,
  keyword_id SERIAL NOT NULL,
  PRIMARY KEY (photo_id,keyword_id));
CREATE INDEX IF NOT EXISTS idx_photos_keywords_keyword_id on photos_keywords (keyword_id);