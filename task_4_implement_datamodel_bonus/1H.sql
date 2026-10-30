SELECT  
        c.utbildningsomrade AS educationarea,
	SUM(CASE
        WHEN a.STUDIEFORM = 'Bunden'
        THEN a.Sokta_platser_totalt
        ELSE 0
    END) AS campus_applications,
	SUM(CASE
        WHEN a.STUDIEFORM = 'Distans'
        THEN a.Sokta_platser_totalt
        ELSE 0
    END) AS remote_applications,
	ROUND(
        100 * SUM(CASE WHEN a.STUDIEFORM = 'Bunden'
            THEN a.Sokta_platser_totalt ELSE 0 END)
        / NULLIF(SUM(a.Sokta_platser_totalt), 0), 2
    ) || '%' AS campus_applications_percentages,
    ROUND(
        100 * SUM(CASE WHEN a.STUDIEFORM = 'Distans'
            THEN a.Sokta_platser_totalt ELSE 0 END)
        / NULLIF(SUM(a.Sokta_platser_totalt), 0), 2
    ) || '%' AS remote_applications_percentages,
    SUM(a.Sokta_platser_totalt) AS total_applications
FROM ANSOKAN a
	JOIN SUN5_INRIKTNING b ON b.SUN5_ID = a.SUN5_ID
	JOIN UTBILDNINGSOMRADE c ON c.UTBILDNINGSOMRADE_ID = b.UTBILDNINGSOMRADE_ID
GROUP BY 
	c.UTBILDNINGSOMRADE
ORDER BY c.UTBILDNINGSOMRADE DESC;	

EXIT
