-- 01_create_tables.sql
-- Création des tables principales

DROP TABLE IF EXISTS loans CASCADE;
DROP TABLE IF EXISTS programs CASCADE;


-- Crrer la table programs
CREATE TABLE programs (
    program_code VARCHAR(20) PRIMARY KEY,
    program_name VARCHAR(100),
    description TEXT
);

-- Crrer la table de prets 
CREATE TABLE loans (
    loan_id VARCHAR(20),
    program VARCHAR(20),
    income_snmg_multiple NUMERIC(6,2),
    loan_amount_da BIGINT,
    property_value_da BIGINT,
    subsidy_da BIGINT,
    term_months INTEGER,
    fico_like_score INTEGER,
    dti NUMERIC(6,3),
    co_borrower SMALLINT,
    region VARCHAR(50),
    ltv NUMERIC(6,3),
    default_flag SMALLINT,
    has_subsidy SMALLINT,
    payment_to_income_proxy NUMERIC(10,6),
    pd_score NUMERIC(10,6),
    pd_decile SMALLINT
);

-- Insertion des programmes
INSERT INTO programs (program_code, program_name, description) VALUES
('LPA', 'Logement Promotionnel Aidé', 'Achat avec subvention'),
('AADL', 'AADL Location-vente', 'Programme location-vente'),
('Rural', 'Logement Rural', 'Aide en zone rurale'),
('Other', 'Autre', 'Hors programme aidé');

-- Afficher la table des programes 
SELECT * FROM programs;