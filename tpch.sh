#!/bin/bash
set -e

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $PWD
source $PWD/env.sh

echo "compile dbgen"
./01compile_dbgen.sh

echo "generate data"
cd ./01_gen_data/
./gen_data.sh ${s_factor}
cd ..

echo "load ddl and index constraint"
./02load_ddl.sh

echo "load data"
./03load_data.sh

echo "run query"
./04run_query.sh
echo "all done~~~"
