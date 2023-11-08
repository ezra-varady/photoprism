CREATE EXTENSION IF NOT EXISTS lantern;
CREATE EXTENSION IF NOT EXISTS lantern_extras;
CREATE INDEX ON files USING hnsw(file_embedding dist_cos_ops) WITH (M=5, dim=512);
SET enable_seqscan=off;
