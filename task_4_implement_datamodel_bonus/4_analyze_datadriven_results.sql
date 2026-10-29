-- analyze datadriven numbers to predict future business decisions
SELECT 
    e.educationarea,
    s.specialization,
    ma.reference,
    a.education,
    ep.education_provider,
    ep.type,
    a.studyform,
    m.municipality,    
    a.applied_rounds,
    a.approved_rounds,
    a.applied_spots,
    a.approved_spots
FROM customers c
JOIN educationarea e ON e.educationarea_id = s.educationarea_id
JOIN sun5_specialization s ON s.sun5_id = a.sun5_id
JOIN seqf_level sl ON sl.seqf_id = a.seqf_id
JOIN education_provider ep ON ep.education_provider_id = a.education_provider_id
JOIN application a ON a.reference_id = ma.reference_id
JOIN municipality_application ma ON ma.municipality_id = m.municipality_id
JOIN municipality m ON m.county_id = c.county_id;

ORDER BY a.approved_rounds, a.approved_spots;


EXIT
