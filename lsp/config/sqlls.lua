return {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql" },
  root_dir = require("lspconfig.util").root_pattern(".git", "package.json"),
  settings = {
    sqlLanguageServer = {
      connections = {
        name = "sqlite3-project",
        adapter = "sqlite3",
      },
    },
    lint = {
      rules = {},
    },
  },
}

-- {
--   "connections": [
--     {
--       "name": "sql-language-server",
--       "adapter": "mysql",
--       "host": "localhost",
--       "port": 3307,
--       "user": "username",
--       "password": "password",
--       "database": "mysql-development",
--       "projectPaths": ["/Users/joe-re/src/sql-language-server"],
--       "ssh": {
--         "user": "ubuntu",
--         "remoteHost": "ec2-xxx-xxx-xxx-xxx.ap-southeast-1.compute.amazonaws.com",
--         "dbHost": "127.0.0.1",
--         "port": 3306,
--         "identityFile": "~/.ssh/id_rsa",
--         "passphrase": "123456"
--       }
--     },
--     {
--       "name": "postgres-project",
--       "adapter": "postgres",
--       "host": "localhost",
--       "port": 5432,
--       "user": "postgres",
--       "password": "pg_pass",
--       "database": "pg_test",
--       "projectPaths": ["/Users/joe-re/src/postgres_project"]
--     },
--     {
--       "name": "sqlite3-project",
--       "adapter": "sqlite3",
--       "filename": "/Users/joe-re/src/sql-language-server/packages/server/test.sqlite3",
--       "projectPaths": ["/Users/joe-re/src/sqlite2_project"]
--     }
--   ]
-- }
