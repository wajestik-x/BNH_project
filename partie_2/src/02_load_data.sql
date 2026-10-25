-- 02_load_data.sql
-- Chargement des données depuis le CSV du Projet 1
-- Adapter le chemin si nécessaire

-- Si \copy... ne fonctione pas, ouvrez Terminal
-- type in :
-- psql -h localhost -U ton_user -d bnh_housing -c "\copy loans FROM chemin/vers/loans_detail.csv' WITH (FORMAT csv, HEADER true)"

\copy loans(loan_id, program, region, loan_amount_da, subsidy_da, income_snmg_multiple, ltv, dti, fico_like_score, term_months, co_borrower, has_subsidy, default_flag, pd_score, pd_decile)
FROM 'data/loans_detail.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');


-- Vérification
SELECT * FROM loans;

-- Total nombre de prets
SELECT COUNT(*) AS total_loans FROM loans;

-- Nombte de prets pour chaque progame
SELECT program, COUNT(*) FROM loans GROUP BY program;