package migrate

// Generated code, do not edit.

var DialectLantern = Migrations{
	{
		ID:         "lantern",
		Dialect:    "lantern",
		Stage:      "main",
		Statements: []string{"CREATE EXTENSION IF NOT EXISTS lantern;", "CREATE EXTENSION IF NOT EXISTS lantern_extras;", "CREATE INDEX ON files USING hnsw(file_embedding dist_cos_ops) WITH (M=5, dim=512);", "SET enable_seqscan=off;"},
	},
}
