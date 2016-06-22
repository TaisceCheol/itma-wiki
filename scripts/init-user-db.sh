#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER confluence;
    CREATE DATABASE confluence;
    GRANT ALL PRIVILEGES ON DATABASE confluence TO confluence;
EOSQL
