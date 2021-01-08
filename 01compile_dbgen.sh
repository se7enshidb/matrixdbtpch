#!/bin/bash
set -e

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $PWD

sudo yum -y install gcc

dbgen=$PWD/00_complie_tpch/dbgen/
cd $dbgen
make
cd ..

echo $PWD
cp ./dbgen/dbgen ./../01_gen_data/
cd ..

