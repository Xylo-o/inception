#!/bin/sh
set -e
envsubst < /docker-entrypoint-initdb.d/init.sql.tpl > /docker-entrypoint-initdb.d/init.sql
exec mysqld_safe