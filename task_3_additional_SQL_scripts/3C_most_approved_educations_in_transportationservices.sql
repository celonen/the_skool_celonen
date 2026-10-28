SET PAGESIZE 1500
DESC system.results_col3;


SELECT
	SUN5_INRIKTNING AS SUN5_code,
	SUN5_INRIKTNING_NAMN AS SUN5_specialization,
	COUNT(*) AS applications,
	SUM(CASE WHEN Beslut = 'Beviljad'
		THEN 1 ELSE 0 END) AS approved,
	SUM(CASE WHEN Beslut = 'Avslag'
		THEN 1 ELSE 0 END) AS rejected,
	ROUND(
	100 * SUM(CASE WHEN Beslut = 'Beviljad'
		THEN 1 ELSE 0 END) / COUNT(*), 2
	) AS approvals_in_percentages
FROM results_col3
WHERE (UTBILDNINGSOMRADE LIKE '%Transporttj_nster%')
	AND Beslut IN ('Beviljad', 'Avslag')
GROUP BY
	SUN5_INRIKTNING,
	SUN5_INRIKTNING_NAMN
ORDER BY approvals_in_percentages DESC;


EXIT
