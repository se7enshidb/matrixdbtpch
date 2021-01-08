\copy customer from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/customer.tbl' with CSV DELIMITER '|';    
\copy supplier from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/supplier.tbl' with CSV DELIMITER '|'; 
\copy nation from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/nation.tbl' with CSV DELIMITER '|';  
\copy region from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/region.tbl' with CSV DELIMITER '|'; 
\copy part from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/part.tbl' with CSV DELIMITER '|';  
\copy partsupp from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/partsupp.tbl' with CSV DELIMITER '|'; 
\copy orders from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/orders.tbl' with CSV DELIMITER '|';  
\copy lineitem from '/home/matrixadmin/matrixdbtpch/01_gen_data/TPCH1/lineitem.tbl' with CSV DELIMITER '|';

checkpoint;
vacuum ANALYZE ;
