SET PAGESIZE 1500
DESC system.results_col3;

SELECT
	UTBILDNINGSNAMN AS education_title
FROM results_col3
WHERE (UTBILDNINGSNAMN LIKE '%AI%');

SELECT
	COUNT(*) AS amount_of_educations_including_AI
FROM results_col3
WHERE (UTBILDNINGSNAMN LIKE '%AI%');

EXIT

