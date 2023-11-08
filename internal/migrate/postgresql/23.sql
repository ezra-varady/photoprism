CREATE TABLE IF NOT EXISTS markers (
  marker_uid bytea NOT NULL,
  file_uid bytea DEFAULT '',
  marker_type bytea DEFAULT '',
  marker_src bytea DEFAULT '',
  marker_name varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  marker_review boolean DEFAULT NULL,
  marker_invalid boolean DEFAULT NULL,
  subj_uid bytea DEFAULT NULL,
  subj_src bytea DEFAULT '',
  face_id bytea DEFAULT NULL,
  face_dist double precision DEFAULT -1,
  embeddings_json bytea DEFAULT NULL,
  landmarks_json bytea DEFAULT NULL,
  x real DEFAULT NULL,
  y real DEFAULT NULL,
  w real DEFAULT NULL,
  h real DEFAULT NULL,
  q int DEFAULT NULL,
  size int DEFAULT -1,
  score smallint DEFAULT NULL,
  thumb bytea DEFAULT '',
  matched_at timestamp DEFAULT NULL,
  created_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT NULL,
  PRIMARY KEY (marker_uid));
CREATE INDEX IF NOT EXISTS idx_markers_file_uid on markers (file_uid);
CREATE INDEX IF NOT EXISTS idx_markers_subj_uid_src on markers (subj_uid,subj_src);
CREATE INDEX IF NOT EXISTS idx_markers_face_id on markers (face_id);
CREATE INDEX IF NOT EXISTS idx_markers_thumb on markers (thumb);
CREATE INDEX IF NOT EXISTS idx_markers_matched_at on markers (matched_at);
