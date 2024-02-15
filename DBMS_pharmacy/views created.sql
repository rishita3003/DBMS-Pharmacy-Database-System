CREATE VIEW DoctorProfile AS
SELECT 
    d.ssn AS doctor_ssn,
    d.name AS doctor_name,
    d.specialty as specialty,
    d.years_exp as experience,
    p.ssn AS patient_ssn,
    p.name AS patient_name,
    p.address AS patient_address,
    p.age AS patient_age,
    pr.drug_trade_name as drug_name,
    pr.quantity as qty,
    dr.formula as formula,
    pr.date AS prescription_date
FROM 
    Doctor d
JOIN 
    Prescribes pr ON d.ssn = pr.doctor_ssn
JOIN 
    Patient p ON pr.patient_ssn = p.ssn
JOIN 
    Drug dr ON pr.drug_trade_name = dr.trade_name AND pr.drug_company_name = dr.company_name



CREATE VIEW PatientProfile AS
SELECT 
    u.id,
    p.ssn AS patient_ssn,
    p.name AS patient_name,
    p.address AS patient_address,
    p.age AS patient_age,
    d.name AS doctor_name,
    d.specialty AS doctor_specialty,
    pr.drug_trade_name as drug_name,
    pr.quantity as qty,
    pr.date AS prescription_date
FROM 
    Patient p
JOIN
    User u ON p.name = u.name
JOIN 
    Doctor d ON p.pri_physician_ssn = d.ssn
JOIN 
    Prescribes pr ON p.ssn = pr.patient_ssn
JOIN 
    Drug dr ON pr.drug_trade_name = dr.trade_name 


    CREATE VIEW PharmacyProfile AS
SELECT 
    ph.name AS pharmacy_name,
    ph.address AS pharmacy_address,
    ph.phone_number AS pharmacy_phone,
    dr.trade_name AS drug_trade_name,
    dr.formula AS drug_formula,
    s.price as price,
    c.start_date AS contract_start_date,
    c.end_date AS contract_end_date,
    c.text AS contract_text,
    c.supervisor_name AS contract_supervisor,
    cp.name AS company_name
FROM 
    Pharmacy ph
JOIN 
    Sells s ON ph.name = s.pharmacy_name
JOIN 
    Drug dr ON s.drug_trade_name = dr.trade_name 
JOIN 
    Contracts c ON ph.name = c.pharmacy_name;
JOIN 
    Pharmaceutical_Company cp ON s.drug_company_name = cp.name


CREATE VIEW CompanyProfile AS
SELECT 
    pc.name AS company_name,
    pc.phone_number AS company_phone,
    ph.name as pharmacy_name,
    ph.address AS pharmacy_address,
    ph.phone_number AS pharmacy_phone,
    dr.trade_name AS drug_trade_name,
    dr.formula AS formula,
    s.price AS price,
    c.start_date AS contract_start_date,
    c.end_date AS contract_end_date,
    c.text AS contract_text,
    c.supervisor_name AS contract_supervisor
FROM 
    Pharmaceutical_Company pc
JOIN 
    Sells s ON pc.name = s.drug_company_name
JOIN 
    Pharmacy ph ON s.pharmacy_name = ph.name
JOIN 
    Drug dr ON s.drug_trade_name = dr.trade_name AND s.drug_company_name = dr.company_name
JOIN 
    Contracts c ON pc.name = c.company_name;


