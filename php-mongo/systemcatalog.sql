SELECT		*
FROM 		pg_depend
WHERE		classid = 40828;

SELECT		*
FROM		pg_depend_tsort;

SELECT	*
FROM	pg_proc
LIMIT 100;

SELECT		*
FROM 		pg_depend
LIMIT		100;

SELECT		*
FROM		pg_tables
LIMIT		100;

SELECT		oid,*
FROM		pg_class
LIMIT		100;

SELECT		oid,*
FROM		pg_namespace;

SELECT		*
FROM		pg_type;

SELECT		*
FROM		pg_proc
--WHERE		oid = 40830
LIMIT		100;
--40458

-------------------------------------------------

SELECT		pg_class.oid       	tabellen_id
		,relname		tabellen_name
FROM		pg_namespace 
		JOIN pg_class ON pg_namespace.oid = pg_class.relnamespace
WHERE		nspname = 'dwh'
AND		relkind = 'r'
ORDER BY	relname;

SELECT		pg_class.oid       	tabellen_id
		,relname		tabellen_name
FROM		pg_namespace 
		JOIN pg_class ON pg_namespace.oid = pg_class.relnamespace
--WHERE		nspname = 'dwh'
--AND		relkind = 'r'
WHERE		pg_class.oid = 40830
ORDER BY	relname;


SELECT DISTINCT pg_class.relname
        ,CASE WHEN pg_class.relkind = 'r' THEN 'table / or constraint table'
            WHEN pg_class.relkind = 'i' THEN 'index'
            WHEN pg_class.relkind = 'v' THEN 'view'
            WHEN pg_class.relkind = 't' THEN 'toast'
            WHEN pg_class.relkind = 'S' THEN 'sequence'
            WHEN pg_class.relkind = 'c' THEN 'composite type'
            WHEN pg_class.relkind = 's' THEN 'special'
            ELSE 'xxx' END AS TYPE
    FROM pg_depend
        ,pg_class
    WHERE objid IN (SELECT objid
                FROM pg_depend
                    ,pg_class cl
                WHERE refobjid = cl.oid
                AND cl.relname = 'campaign_dim'
                )
    AND (pg_class.oid = pg_depend.objid
        OR pg_class.oid = pg_depend.refobjid)
    ORDER BY TYPE DESC;



40830
40831
40832
40836
40826


SELECT	proname,prosrc
	--p.*
FROM	pg_namespace n
	JOIN pg_proc p ON n.oid = p.pronamespace
WHERE	n.nspname = 'ap_debitor_report'
AND	p.prosrc LIKE '%test_dw_debitor_report%'
ORDER BY 1;


SELECT		proname 
FROM		pg_namespace n 
		JOIN pg_proc p ON n.oid = p.pronamespace 
--WHERE 		n.nspname = 'dwh' 
--AND 		prosrc LIKE '%dwh.category_dim%';
WHERE 		prosrc LIKE '%temporary.emails%';


SELECT * FROM dwh.junk_dim

SELECT * FROM dwh.order_item_fact LIMIT 100;

