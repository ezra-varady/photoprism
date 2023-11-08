CREATE TABLE IF NOT EXISTS photos_labels (
  photo_id SERIAL NOT NULL,
  label_id SERIAL NOT NULL,
  label_src bytea DEFAULT NULL,
  uncertainty smallint DEFAULT NULL,
  PRIMARY KEY (photo_id,label_id));
CREATE INDEX IF NOT EXISTS idx_photos_labels_label_id on photos_labels (label_id);
