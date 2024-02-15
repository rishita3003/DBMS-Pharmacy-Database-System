INSERT INTO Doctor (ssn, name, specialty, years_exp) VALUES ('123-45-6789', 'John Doe', 'Cardiology', 10);
INSERT INTO Patient (ssn, name, address, age, pri_physician_ssn) VALUES ('987-65-4321', 'Jane Smith', '123 Main St, Anytown, USA', 45, '123-45-6789');


INSERT INTO Doctor (ssn, name, specialty, years_exp) VALUES
('111-22-3333', 'Alice Johnson', 'Cardiology', 12),
('222-33-4444', 'Bob Smith', 'Neurology', 8),
('333-44-5555', 'Carol White', 'Pediatrics', 5),
('444-55-6666', 'David Brown', 'Orthopedics', 15),
('555-66-7777', 'Eve Davis', 'Dermatology', 9),
('666-77-8888', 'Frank Miller', 'Oncology', 20),
('777-88-9999', 'Grace Lee', 'Gastroenterology', 7),
('888-99-0000', 'Henry Wilson', 'Radiology', 10),
('999-00-1111', 'Isabel Garcia', 'Anesthesiology', 6),
('000-11-2222', 'Jack Taylor', 'General Surgery', 14);


INSERT INTO Patient (ssn, name, address, age, pri_physician_ssn) VALUES
('987-65-4321', 'Jane Smith', '123 Main St, Anytown, USA', 45, '111-22-3333'),
('876-54-3210', 'John Doe', '456 Elm St, Yourtown, USA', 37, '222-33-4444'),
('765-43-2109', 'Julia Jones', '789 Oak St, Thistown, USA', 30, '333-44-5555'),
('654-32-1098', 'Kyle Brown', '321 Pine St, Mytown, USA', 26, '444-55-6666'),
('543-21-0987', 'Laura Wilson', '654 Maple St, Hertown, USA', 52, '555-66-7777'),
('432-10-9876', 'Michael Davis', '987 Cedar St, Othertown, USA', 41, '666-77-8888'),
('321-09-8765', 'Nancy Allen', '123 Birch St, Anothertown, USA', 63, '777-88-9999'),
('210-98-7654', 'Oscar Gonzalez', '456 Walnut St, Elsewhere, USA', 38, '888-99-0000'),
('109-87-6543', 'Patricia Hernandez', '789 Spruce St, Sometown, USA', 29, '999-00-1111'),
('098-76-5432', 'Quincy Adams', '321 Redwood St, Nowheretown, USA', 47, '000-11-2222');


INSERT INTO UserLogin (username, password_hash, role,name) VALUES
('alicejohnson', password('alicejohnson'), 'doctor', 'Alice Johnson'),
('johndoe',password('johndoe'),'doctor','John Doe'),
('bobsmith', PASSWORD('bobsmith'), 'doctor', 'Bob Smith'),
('frankmiller', PASSWORD('frankmiller'), 'doctor','Frank Miller'),
('henrywilson', PASSWORD('henrywilson'), 'doctor','Henry Wilson'),
('isabelgarcia', PASSWORD('isabelgarcia'), 'doctor','Isabel Garcia'),
('jacktaylor', PASSWORD('jacktaylor'), 'doctor','Jack Taylor');



INSERT INTO UserLogin (username, password_hash, role, name) VALUES
('janesmith', PASSWORD('janesmith'), 'patient', 'Jane Smith'),
('juliajones', PASSWORD('juliajones'), 'patient', 'Julia Jones'),
('laurawilson', PASSWORD('laurawilson'), 'patient', 'Laura Wilson'),
('michaeldavis', PASSWORD('michaeldavis'), 'patient', 'Michael Davis'),
('oscargonzalez', PASSWORD('oscargonzalez'), 'patient', 'Oscar Gonzalez'),
('patriciahernandez', PASSWORD('patriciahernandez'), 'patient', 'Patricia Hernandez'),
('quincyadams', PASSWORD('quincyadams'), 'patient', 'Quincy Adams');

INSERT INTO UserLogin (username, password_hash, role, name) VALUES
('GoodHealthPharmacy', password('GoodHealthPharmacy'), 'pharmacist', 'GoodHealth Pharmacy'),
('CarePlusPharmacy', password('CarePlusPharmacy'), 'pharmacist', 'CarePlus Pharmacy'),
('PillboxPharmacy', password('PillboxPharmacy'), 'pharmacist', 'Pillbox Pharmacy'),
('MediMartPharmacy', password('MediMartPharmacy'), 'pharmacist', 'MediMart Pharmacy'),
('WellPharmPharmacy', password('WellPharmPharmacy'), 'pharmacist', 'WellPharm Pharmacy'),
('ApothecarePharmacy', password('ApothecarePharmacy'), 'pharmacist', 'Apothecare Pharmacy');

INSERT INTO UserLogin (username, password_hash, role, name) VALUES
('MediCarePharma', password('MediCarePharma'), 'company', 'MediCare Pharma'),
('HealthPlusPharmaceuticals', password('HealthPlusPharmaceuticals'), 'company', 'HealthPlus Pharmaceuticals'),
('WellnessLabs', password('WellnessLabs'), 'company', 'Wellness Labs'),
('CureAllPharma', password('CureAllPharma'), 'company', 'CureAll Pharma'),
('LifeSavePharmaceuticals', password('LifeSavePharmaceuticals'), 'company', 'LifeSave Pharmaceuticals');


INSERT INTO pharmaceutical_company (company_name, phone_number) VALUES
('MediCare Pharma', '123-456-7890'),
('HealthPlus Pharmaceuticals',  '234-567-8901'),
('Wellness Labs','345-678-9012'),
('CureAll Pharma','456-789-0123'),
('LifeSave Pharmaceuticals', '567-890-1234');

INSERT INTO Drug (trade_name, formula, company_name) VALUES
('Amoxicillin', 'C16H19N3O5S', 'Wellness Labs'),
('Ibuprofen', 'C13H18O2', 'MediCare Pharma'),
('Loratadine', 'C22H23ClN2O2', 'HealthPlus Pharmaceuticals'),
('Metformin', 'C4H11N5', 'Wellness Labs'),
('Amlodipine', 'C20H25ClN2O5', 'CureAll Pharma'),
('Simvastatin', 'C25H38O5', 'MediCare Pharma'),
('Lisinopril', 'C21H31N3O5', 'LifeSave Pharmaceuticals'),
('Omeprazole', 'C17H19N3O3S', 'Wellness Labs'),
('Atorvastatin', 'C33H35FN2O5', 'CureAll Pharma'),
('Cetirizine', 'C21H25ClN2O3', 'HealthPlus Pharmaceuticals');

INSERT INTO Pharmacy (name, address, phone_number) VALUES
('GoodHealth Pharmacy', '123 Wellness Rd, Springfield, ST 12345', '555-1234'),
('CarePlus Pharmacy', '456 Care Ave, Shelbysville, ST 67890', '555-5678'),
('Pillbox Pharmacy', '789 Pill St, Oakdale, ST 10112', '555-1011'),
('MediMart Pharmacy', '321 Meds Blvd, Rivertown, ST 13145', '555-1314'),
('WellPharm Pharmacy', '654 Health Way, Lakeside, ST 14151', '555-1415'),
('Apothecare Pharmacy', '852 Cure Close, Cliffside, ST 16117', '555-1616');

INSERT INTO Prescribes (doctor_ssn, drug_trade_name, drug_company_name, patient_ssn, date, quantity) VALUES
('123-45-6789', 'Amoxicillin', 'Wellness Labs', '987-65-4321', '2024-01-10', 30),
('666-77-8888', 'Ibuprofen', 'Medicare Pharma', '210-98-7654', '2024-02-15', 15),
('000-11-2222', 'Loratadine', 'HealthPlus Pharmaceuticals', '098-76-5432', '2024-03-20', 10),
('888-99-0000', 'Metformin', 'Wellness Labs', '543-21-0987', '2024-04-25', 60),
('999-00-1111', 'Amlodipine', 'CureAll Pharma', '109-87-6543', '2024-05-30', 30),
('666-77-8888', 'Simvastatin', 'MediCare Pharma', '765-43-2109', '2024-06-04', 28);

INSERT INTO Sells (pharmacy_name, drug_trade_name, drug_company_name, price) VALUES
('GoodHealth Pharmacy', 'Amoxicillin', 'Wellness Labs', 10.00),
('CarePlus Pharmacy', 'Ibuprofen', 'Medicare Pharma', 5.00),
('Pillbox Pharmacy', 'Loratadine', 'HealthPlus Pharmaceuticals', 8.50),
('MediMart Pharmacy', 'Metformin', 'Wellness Labs', 7.20),
('WellPharm Pharmacy', 'Amlodipine', 'CureAll Pharma', 12.75),
('Apothecare Pharmacy', 'Simvastatin', 'MediCare Pharma', 15.00);


INSERT INTO Contracts (company_name, pharmacy_name, start_date, end_date, text, supervisor_name) VALUES
('MediCare Pharma', 'GoodHealth Pharmacy', '2024-01-01', '2024-12-31', 'Contract for the year 2024.', 'Bill Hoe'),
('HealthPlus Pharmaceuticals', 'CarePlus Pharmacy', '2024-02-01', '2025-01-31', 'Contract for medical supplies.', 'Jack Price'),
('Wellness Labs', 'Pillbox Pharmacy', '2023-06-01', '2024-05-30', 'Contract for wellness products.', 'Louise Smith'),
('CureAll Pharma', 'MediMart Pharmacy', '2024-03-15', '2025-03-14', 'Contract for exclusive medication provision.', 'Minko Lee'),
('LifeSave Pharmaceuticals', 'WellPharm Pharmacy', '2023-09-01', '2024-08-31', 'Contract for emergency medicine supply.', 'Tina Brat');

