#!/bin/bash
set -e
PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $PWD
source $PWD/env.sh

echo "start load dll"
time psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -f ./02_ddl/matrixddl.ddl
echo "finished load ddl"

