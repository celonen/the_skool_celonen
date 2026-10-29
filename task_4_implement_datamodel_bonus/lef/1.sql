SELECT table_name,
       column_name,
       generation_type
FROM user_tab_identity_cols
WHERE table_name = 'KOMMUN';

EXIT
