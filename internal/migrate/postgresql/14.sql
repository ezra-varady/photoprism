CREATE TABLE IF NOT EXISTS faces (
  id bytea NOT NULL,
  face_src bytea DEFAULT NULL,
  face_kind int DEFAULT NULL,
  face_hidden boolean DEFAULT NULL,
  subj_uid bytea DEFAULT '',
  samples int DEFAULT NULL,
  sample_radius double precision DEFAULT NULL,
  collisions int DEFAULT NULL,
  collision_radius double precision DEFAULT NULL,
  embedding_json bytea DEFAULT NULL,
  matched_at timestamp DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (id));
CREATE INDEX IF NOT EXISTS idx_faces_subj_uid on faces (subj_uid);
