SELECT * FROM results_col3;

CREATE TABLE IF NOT EXISTS educationarea AS
SELECT
    ROW_NUMBER() OVER (ORDER BY educationarea) AS educationarea_id,
    educationarea
FROM (SELECT DISTINCT UTBILDNINGSOMRADE FROM results_col3);


CREATE TABLE IF NOT EXISTS seqf_level AS
SELECT
    ROW_NUMBER() OVER (ORDER BY seqf_code) AS seqf_id,
    SEQF_NIVA AS seqf,
    examenstyp AS degree
FROM (SELECT DISTINCT SEQF_NIVA, EXAMENSTYP FROM results_col3);


CREATE TABLE IF NOT EXISTS education_provider AS
SELECT
    ROW_NUMBER() OVER (ORDER BY education_provider) AS education_provider_id,
    UTBILDNINGSANORDNARE_ADMINISTR AS education_provider,
    HUVUDMANNATYP AS type
FROM (SELECT DISTINCT UTBILDNINGSANORDNARE_ADMINISTR, HUVUDMANNATYP FROM results_col3);


CREATE TABLE IF NOT EXISTS county AS
SELECT
    ROW_NUMBER() OVER (ORDER BY county) AS county_id,
    county
FROM (SELECT DISTINCT LAN results_col3);


SELECT * FROM educationarea;

CREATE TABLE IF NOT EXISTS sun5_specialization AS
SELECT
    DISTINCT r.sun5_id,
    r.sun5_inriktning AS sun5_code,
    r.sun5_inriktning_namn AS specialization,
    e.educationarea_id
FROM results_col3 r
JOIN educationarea e ON e.educationarea_id = s.educationarea_id;


SELECT * FROM county;

CREATE TABLE IF NOT EXISTS municipality AS
SELECT
    DISTINCT r.municipality_id,
    r.kommun AS municipality,
    c.county_id
FROM results_col3 r
JOIN county c ON c.county_id = m.county_id;


SELECT * FROM municipality;

CREATE TABLE IF NOT EXISTS municipality_application AS
SELECT
    DISTINCT r.municipality_application_id,
    r.diarienummer AS reference,
    m.municipality_id
FROM results_col3 r
JOIN municipality m ON m.municipality_id = ma.municipality_id
                AND a.reference = ma.reference;


SELECT * FROM sun5_specialization;

CREATE TABLE IF NOT EXISTS application AS
SELECT
    r.sun5_id,
    ROW_NUMBER() OVER (PARTITION BY r.sun5_id ORDER BY ma.municipality_id) AS application_no, 
    r.diarienummer AS reference_id,
    r.seqf_id,
    r.education_provider_id,
    r.utbildningsnamn AS education,
    r.beslut AS decision,
    r.yh_poang AS yh_points,
    r.studieform AS studyform,
    r.studietakt AS studypace,
    r.smalt_yrkesomrade AS narrow_occupation,
    r.sokta_utbildningsomgangar AS applied_rounds,
    r.beviljade_utbildningsomgangar AS approved_rounds,
    r.sokta_platser_totalt AS total_applied_spots,
    r.beviljade_platser_totalt AS total_approved_spots
FROM results_col3 r
JOIN municipality_application ma ON a.reference_id = ma.reference
                AND a.municipality_id = ma.municipality_id;


SELECT * FROM application;


EXIT