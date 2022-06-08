#!/bin/sh
set -e

# just scaffolding, experiment 
# for possible later use

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE SCHEMA IF NOT EXISTS my_extensions;
  CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA my_extensions;
  CREATE EXTENSION IF NOT EXISTS "pg_stat_statements"  SCHEMA my_extensions;
  SELECT extname AS new_extension_created FROM pg_extension;
  DROP EXTENSION IF EXISTS "uuid-ossp";
  DROP SCHEMA IF EXISTS my_extensions;
  SELECT extname AS new_extension_deleted FROM pg_extension;
EOSQL