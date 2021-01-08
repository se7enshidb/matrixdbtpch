\timing
select
    cntrycode,
    count(*) as numcust,
    sum(c_acctbal) as totacctbal
from
(
    select
        substring(c_phone from 1 for 2) as cntrycode,
        c_acctbal
    from
        customer
        left join orders on o_custkey = c_custkey and o_custkey is null
    where
        substring(c_phone from 1 for 2) in ('34', '18', '30', '24', '33', '22', '29')
        and c_acctbal > 
        (
            select
                avg(c_acctbal)
            from
                customer
            where
                c_acctbal > 0.00
                and substring(c_phone from 1 for 2) in ('34', '18', '30', '24', '33', '22', '29')
        ) 
) as custsale
group by
    cntrycode
order by
    cntrycode
LIMIT 1;
