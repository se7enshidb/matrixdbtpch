#/bin/bash
cd $PWD
echo $PWD
source $PWD/env.sh

st=`date "+%Y%m%d%H%M"`
mkdir $PWD/05_result/result${st} -p
for i in {1..23}
do
time psql -h $PGHOST -p $PGPORT -d $PGDATABASE -f $PWD/04_query/matrixqueries/${i}.sql > $PWD/05_result/result${st}/Q${i}_result.out
time psql -h $PGHOST -p $PGPORT -d $PGDATABASE -f $PWD/04_query/explainmatrixqueries/${i}.sql > $PWD/05_result/result${st}/explain_${i}_result.out
A=`tail -1 $PWD/05_result/result${st}/Q${i}_result.out`
echo $i,$A >> $PWD/05_result/result${st}/${PGDATABASE}.log
done

time psql -h $PGHOST -p $PGPORT -d $PGDATABASE -c 'checkpoint'
time psql -h $PGHOST -p $PGPORT -d $PGDATABASE -c 'vacuum analyse'
