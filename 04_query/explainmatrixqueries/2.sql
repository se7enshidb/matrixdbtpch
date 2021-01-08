explain
select
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
from
    part,
    supplier,
    partsupp,
    nation,
    region,
    (
        select
            ps_partkey,
            min(ps_supplycost) as min
        from
            partsupp,
            supplier,
            nation,
            region
        where
            s_suppkey = ps_suppkey
            and s_nationkey = n_nationkey
            and n_regionkey = r_regionkey
            and r_name = 'EUROPE'
        group by
            ps_partkey
    ) temp
where
    p_partkey = partsupp.ps_partkey
    and s_suppkey = ps_suppkey
    and p_size = 47
    and p_type like '%BRASS'
    and s_nationkey = n_nationkey
    and n_regionkey = r_regionkey
    and r_name = 'EUROPE'
    and ps_supplycost = temp.min
    and p_partkey = temp.ps_partkey
order by
    s_acctbal desc,
    n_name,
    s_name,
    p_partkey
LIMIT 100;
