# 文档结构如下
```
[matrixadmin@mdw matrixdbtpch]$ tree . -L 2
.
|-- 00_complie_tpch
|   |-- dbgen
|   `-- queries
|-- 01_gen_data
|   |-- dbgen
|   |-- dists.dss
|   `-- gen_data.sh
|-- 01compile_dbgen.sh
|-- 02_ddl
|   |-- constraint_index.sql
|   |-- dss.ddl
|   `-- matrixddl.ddl
|-- 02load_ddl.sh
|-- 03_load_data
|   `-- load_data.sql
|-- 03load_data.sh
|-- 04_query
|   |-- explainmatrixqueries
|   `-- matrixqueries
|-- 04run_query.sh
|-- 05_result
|   |-- result202101081603
|   `-- result202101081711
|-- README.md
|-- delete_log.sh
|-- env.sh
|-- log
`-- tpch.sh
```
- tpch.sh   入口
  - 01compile_dbgen.sh  编译dbgen
  - 02load_ddl.sh       加载表ddl及索引
  - 03load_data.sh      加载数据到表里面
  - 04run_query.sh      运行tpch的SQL
  
- delete_log.sh  清除日志及运行结果

## 手工运行
run tpch.sh

## 后台运行
nohup ./tpch.sh > ./log/run.log 2>&1 &

## 参数配置
 - `env.sh` 参数文件
 - s_factor 为生成tpch数据规模参数
 - 其它MPP连接参数，按照自己的环境进行修改。
