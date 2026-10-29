-- alter PK for each table
ALTER TABLE educationarea		ADD CONSTRAINTS educationarea_pk		PRIMARY KEY (educationarea_id);
ALTER TABLE seqf_level 			ADD CONSTRAINT seqf_level_pk    		PRIMARY KEY (seqf_id);
ALTER TABLE education_provider      	ADD CONSTRAINT education_provider_pk      	PRIMARY KEY (education_provider_id);
ALTER TABLE county 			ADD CONSTRAINT county_pk 			PRIMARY KEY (county_id);
ALTER TABLE sun5_specialization		ADD CONSTRAINTS sun5_specialization_pk		PRIMARY KEY (sun5_id);
ALTER TABLE municipality		ADD CONSTRAINT municipality_pk    		PRIMARY KEY (municipality_id);
ALTER TABLE municipality_application    ADD CONSTRAINT municipality_application_pk      PRIMARY KEY (municipality_application_id);
ALTER TABLE application 		ADD CONSTRAINT application_pk 			PRIMARY KEY (reference_id);

-- alter FK
ALTER TABLE sun5_specialization		ADD CONSTRAINT sun5_fk
  FOREIGN KEY (educationarea_id) 		REFERENCES educationarea (educationarea_id);
ALTER TABLE municipality 		ADD CONSTRAINT muncipality_fk
  FOREIGN KEY (county_id)   			REFERENCES county (county_id);
ALTER TABLE municipality_application 	ADD CONSTRAINT municipality_application_fk
  FOREIGN KEY (reference) 			REFERENCES application (reference_id);
ALTER TABLE municipality_application 	ADD CONSTRAINT municipality_application_fk
  FOREIGN KEY (municipality_id) 		REFERENCES muncipality (municipality_id);
ALTER TABLE application			ADD CONSTRAINT application_fk
  FOREIGN KEY (sun5_id)   			REFERENCES sun5_specialization (sun5_id);
ALTER TABLE application	 		ADD CONSTRAINT application_fk
  FOREIGN KEY (seqf_id) 			REFERENCES seqf_level (seqf_id);
ALTER TABLE application 		ADD CONSTRAINT application_fk
  FOREIGN KEY (education_provider_id) 		REFERENCES education_provider (education_provider_id);


EXIT
