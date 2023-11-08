package migrate

import "sync"

// Supported database dialects.
const (
	MySQL      = "mysql"
	SQLite3    = "sqlite3"
	PostgreSQL = "postgres"
)

var Dialects = map[string]Migrations{
	MySQL:      DialectMySQL,
	SQLite3:    DialectSQLite3,
	PostgreSQL: DialectPostgreSQL,
}

var once = map[string]*sync.Once{
	MySQL:      {},
	SQLite3:    {},
	PostgreSQL: {},
}
