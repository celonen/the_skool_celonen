DESC system.application;

SELECT * FROM educationarea;
SELECT * FROM sun5_specialization;
SELECT * FROM seqf_level;
SELECT * FROM education_provider;
SELECT * FROM application;
SELECT * FROM municipality_application;
SELECT * FROM municipality;
SELECT * FROM county;

SELECT * FROM results_col3;


-- recreate the results_col3 table using JOIN
SELECT 
    e.educationarea,
    s.specialization,
    sl.seqf,
    ep.education_provider,
    a.education,
    ma.reference,
    m.municipality,
    c.county
FROM educationarea e
JOIN educationarea e ON e.educationarea_id = s.educationarea_id
JOIN sun5_specialization s ON s.sun5_id = a.sun5_id
JOIN seqf_level sl ON sl.seqf_id = a.seqf_id
JOIN education_provider ep ON ep.education_provider_id = a.education_provider_id
JOIN application a ON a.reference_id = ma.reference_id
JOIN municipality_application ma ON ma.municipality_id = m.municipality_id
JOIN municipality m ON m.county_id = c.county_id;

ORDER BY e.educationarea_id, a.education;


EXIT