SET PAGESIZE 1500
DESC system.results_col3;

SELECT
    r1.utbildningsomrade AS educationarea,
    SUM(CASE
        WHEN r1.STUDIEFORM = 'Bunden'
        THEN r1.Sokta_platser_totalt
        ELSE 0
    END) AS campus_applications,
    SUM(CASE
        WHEN r1.STUDIEFORM = 'Distans'
        THEN r1.Sokta_platser_totalt
        ELSE 0
    END) AS remote_applications,
    ROUND(
        100 * SUM(CASE WHEN r1.STUDIEFORM = 'Bunden'
            THEN r1.Sokta_platser_totalt ELSE 0 END)
        / NULLIF(SUM(r1.Sokta_platser_totalt), 0), 2
    ) || '%' AS campus_applications_percentages,
    ROUND(
        100 * SUM(CASE WHEN r1.STUDIEFORM = 'Distans'
            THEN r1.Sokta_platser_totalt ELSE 0 END)
        / NULLIF(SUM(r1.Sokta_platser_totalt), 0), 2
    ) || '%' AS remote_applications_percentages,
    SUM(r1.Sokta_platser_totalt) AS total_applications
FROM results_col3 r1
GROUP BY
    r1.utbildningsomrade
ORDER BY
    r1.utbildningsomrade DESC;

EXIT


