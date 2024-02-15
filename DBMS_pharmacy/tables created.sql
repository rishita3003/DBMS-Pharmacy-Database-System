CREATE TABLE Patient (
    ssn VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    pri_physician_ssn VARCHAR(255),
    FOREIGN KEY (pri_physician_ssn) REFERENCES Doctor(ssn)
);

CREATE TABLE Doctor (
    ssn VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255) NOT NULL,
    years_exp INT NOT NULL
);

CREATE TABLE Pharmaceutical_Company (
    name VARCHAR(255) PRIMARY KEY,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE Drug (
    trade_name VARCHAR(255) NOT NULL,
    formula VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (trade_name, company_name),
    FOREIGN KEY (company_name) REFERENCES Pharmaceutical_Company(name)
);

CREATE TABLE Pharmacy (
    name VARCHAR(255) PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE Prescribes (
    doctor_ssn VARCHAR(255),
    drug_trade_name VARCHAR(255),
    drug_company_name VARCHAR(255),
    patient_ssn VARCHAR(255),
    date DATE NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (doctor_ssn, drug_trade_name, drug_company_name, patient_ssn),
    FOREIGN KEY (doctor_ssn) REFERENCES Doctor(ssn),
    FOREIGN KEY (drug_trade_name, drug_company_name) REFERENCES Drug(trade_name, company_name),
    FOREIGN KEY (patient_ssn) REFERENCES Patient(ssn)
);

CREATE TABLE Sells (
    pharmacy_name VARCHAR(255),
    drug_trade_name VARCHAR(255),
    drug_company_name VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (pharmacy_name, drug_trade_name, drug_company_name),
    FOREIGN KEY (pharmacy_name) REFERENCES Pharmacy(name),
    FOREIGN KEY (drug_trade_name, drug_company_name) REFERENCES Drug(trade_name, company_name)
);

CREATE TABLE Contracts (
    company_name VARCHAR(255),
    pharmacy_name VARCHAR(255),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    text TEXT NOT NULL,
    supervisor_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (company_name, pharmacy_name),
    FOREIGN KEY (company_name) REFERENCES Pharmaceutical_Company(name),
    FOREIGN KEY (pharmacy_name) REFERENCES Pharmacy(name)
);

CREATE TABLE UserLogin (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('doctor', 'patient', 'pharmacist', 'company') NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


