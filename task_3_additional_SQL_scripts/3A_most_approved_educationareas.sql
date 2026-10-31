SET PAGESIZE 1500
DESC system.results_col3;

SELECT
	UTBILDNINGSOMRADE AS educationarea,
	COUNT(*) AS total_applications,
	SUM(CASE WHEN Beslut = 'Beviljad'
		THEN 1 ELSE 0 END) AS approved_applications,
	SUM(CASE WHEN Beslut = 'Avslag'
		THEN 1 ELSE 0 END) AS rejected_applications,
	ROUND(
	100 * SUM(CASE WHEN Beslut = 'Beviljad'
		THEN 1 ELSE 0 END) / COUNT(*), 2
	) || '%' AS approvals_in_percentages
FROM results_col3
GROUP BY UTBILDNINGSOMRADE
ORDER BY approvals_in_percentages DESC;

EXIT
