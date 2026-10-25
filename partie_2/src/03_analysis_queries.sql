-- 03_analysis_queries.sql
-- Requêtes d'analyse principales

-- 1. Taux de défaut par programme
SELECT 
    p.program_name,
    COUNT(*) AS loans,
    ROUND(AVG(l.default_flag)::numeric, 3) AS default_rate,
    ROUND(AVG(l.pd_score)::numeric, 3) AS avg_pd
FROM loans l
JOIN programs p ON l.program = p.program_code
GROUP BY p.program_name
ORDER BY default_rate DESC;

-- 2. Volume de subventions par programme
SELECT 
    program,
    COUNT(*) AS loans_with_subsidy,
    SUM(subsidy_da) AS total_subsidy_da,
    ROUND(AVG(subsidy_da)) AS avg_subsidy
FROM loans
WHERE has_subsidy = 1
GROUP BY program
ORDER BY total_subsidy_da DESC;

-- 3. Risque par décile de PD
SELECT 
    pd_decile,
    COUNT(*) AS loans,
    ROUND(AVG(default_flag)::numeric, 3) AS actual_default_rate,
    ROUND(AVG(pd_score)::numeric, 3) AS avg_predicted_pd
FROM loans
GROUP BY pd_decile
ORDER BY pd_decile;

-- 4. Performance par région
SELECT 
    region,
    COUNT(*) AS loans,
    ROUND(AVG(default_flag)::numeric, 3) AS default_rate
FROM loans
GROUP BY region
ORDER BY loans DESC;
