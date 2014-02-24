SELECT		pg_class.oid       	tabellen_id
		,relname		tabellen_name
FROM		pg_namespace 
		JOIN pg_class ON pg_namespace.oid = pg_class.relnamespace
WHERE		nspname = 'ap_mr'
AND		relkind = 'r'
ORDER BY	relname;

