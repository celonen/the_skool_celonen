SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'UTBILDNINGSOMRADE'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'SUN5_INRIKTNING'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'SEQF'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'ANORDNARE'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'LAN'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'KOMMUN'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'ANSOKAN_KOMMUN'
ORDER BY column_id;


SELECT column_name,
       data_type,
       data_length,
       nullable
FROM user_tab_columns
WHERE table_name = 'ANSOKAN'
ORDER BY column_id;

EXIT
