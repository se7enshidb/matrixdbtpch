#!/bin/bash
set -e

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $PWD
s_factor=$1

mkdir $PWD/TPCH${s_factor} -p
./dbgen -s ${s_factor}
mv *.tbl ./TPCH${s_factor}/
