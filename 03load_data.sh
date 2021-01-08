#!/bin/bash
set -e

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $PWD
source $PWD/env.sh

data_path=$PWD/01_gen_data/TPCH${s_factor}
echo $data_path
psql_str="psql -h $PGHOST -U $PGUSER -d $PGDATABASE -p $PGPORT -c"
echo $psql_str

for i in `ls ${data_path}`
do 
  table_name=${i%.*}
  file_name=${i} 
  echo $file_name $table_name
  copy_str="copy ${table_name} from '$data_path/${file_name}' with csv delimiter '|'"
  echo ${copy_str}
  $psql_str "${copy_str}" 
done

<< comment
echo "start load data"
time psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -f ./03_load_data/load_data.sql
echo "finished load data"

echo "start load index and constraint"
time psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -f ./02_ddl/constraint_index.sql
echo "finish load index and constraint"
comment
