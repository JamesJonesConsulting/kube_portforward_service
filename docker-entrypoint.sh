#!/bin/bash
set -e

# if [ "$1" = 'postgres' ]; then
#     chown -R postgres "$PGDATA"

#     if [ -z "$(ls -A "$PGDATA")" ]; then
#         gosu postgres initdb
#     fi

#     exec gosu postgres "$@"
# fi
exec kubectl port-forward --address 0.0.0.0 "$@" svc/mariadb-prod 3306:3306; wait
