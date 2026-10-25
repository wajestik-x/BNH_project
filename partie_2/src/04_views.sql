-- 04_views.sql
-- Vues prêtes pour le reporting et Power BI

CREATE OR REPLACE VIEW v_default_by_program AS
SELECT 
    p.program_name,
    COUNT(*) AS loans,
    ROUND(AVG(l.default_flag)::numeric, 3) AS default_rate,
    ROUND(AVG(l.pd_score)::numeric, 3) AS avg_pd,
    SUM(l.subsidy_da) AS total_subsidy
FROM loans l
JOIN programs p ON l.program = p.program_code
GROUP BY p.program_name;

CREATE OR REPLACE VIEW v_risk_deciles AS
SELECT 
    pd_decile,
    COUNT(*) AS loans,
    ROUND(AVG(default_flag)::numeric, 3) AS actual_default_rate,
    ROUND(AVG(pd_score)::numeric, 3) AS avg_predicted_pd
FROM loans
GROUP BY pd_decile
ORDER BY pd_decile;


CREATE OR REPLACE VIEW v_region_summary AS
SELECT 
    region,
    program,
    COUNT(*) AS loans,
    ROUND(AVG(default_flag)::numeric, 3) AS default_rate,
    SUM(subsidy_da) AS total_subsidy
FROM loans
GROUP BY region, program;

SELECT * FROM v_default_by_program;
SELECT * FROM v_risk_deciles; 
SELECT * FROM v_region_summary;

-- Pour exporter les views/tables vers /outputs
-- psql -h localhost -U ton_user -d bnh_housing
--- \copy (SELECT * FROM v_risk_deciles) TO '/home/wk/Downloads/GROK/BNH_Project2_SQL/outputs/risk_deciles.csv' WITH CSV HEADER;
-- \copy (SELECT * FROM v_default_by_program) TO '/home/wk/Downloads/GROK/BNH_Project2_SQL/outputs/default_by_program.csv' WITH CSV HEADER;
-- \copy (SELECT * FROM v_region_summary) TO '/home/wk/Downloads/GROK/BNH_Project2_SQL/outputs/region_summary.csv' WITH CSV HEADER;