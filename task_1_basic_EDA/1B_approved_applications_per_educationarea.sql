SET PAGESIZE 1500
DESC system.results_col3;


SELECT UTBILDNINGSOMRADE AS educationarea,
        SUM(BEVILJADE_PLATSER_TOTALT) AS approved_applications
FROM results_col3
GROUP BY UTBILDNINGSOMRADE
ORDER BY approved_applications DESC;


EXIT
