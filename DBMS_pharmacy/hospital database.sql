-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 03:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `companyprofile`
-- (See below for the actual view)
--
CREATE TABLE `companyprofile` (
`company_name` varchar(255)
,`company_phone` varchar(255)
,`pharmacy_name` varchar(255)
,`pharmacy_address` varchar(255)
,`pharmacy_phone` varchar(255)
,`drug_trade_name` varchar(255)
,`formula` varchar(255)
,`price` decimal(10,2)
,`contract_start_date` date
,`contract_end_date` date
,`contract_text` text
,`contract_supervisor` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `company_name` varchar(255) NOT NULL,
  `pharmacy_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `text` text NOT NULL,
  `supervisor_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`company_name`, `pharmacy_name`, `start_date`, `end_date`, `text`, `supervisor_name`) VALUES
('CureAll Pharma', 'MediMart Pharmacy', '2024-03-15', '2025-03-14', 'Contract for exclusive medication provision.', 'Minko Lee'),
('HealthPlus Pharmaceuticals', 'CarePlus Pharmacy', '2024-02-01', '2025-01-31', 'Contract for medical supplies.', 'Jack Price'),
('LifeSave Pharmaceuticals', 'WellPharm Pharmacy', '2023-09-01', '2024-08-31', 'Contract for emergency medicine supply.', 'Tina Brat'),
('MediCare Pharma', 'GoodHealth Pharmacy', '2024-01-01', '2024-12-31', 'Contract for the year 2024.', 'Bill Hoe'),
('Wellness Labs', 'Pillbox Pharmacy', '2023-06-01', '2024-05-30', 'Contract for wellness products.', 'Louise Smith');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ssn` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialty` varchar(255) NOT NULL,
  `years_exp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ssn`, `name`, `specialty`, `years_exp`) VALUES
('000-11-2222', 'Jack Taylor', 'General Surgery', 14),
('111-22-3333', 'Alice Johnson', 'Cardiology', 12),
('123-45-6789', 'John Doe', 'Cardiology', 10),
('222-33-4444', 'Bob Smith', 'Neurology', 8),
('666-77-8888', 'Frank Miller', 'Oncology', 20),
('888-99-0000', 'Henry Wilson', 'Gynecologist', 10),
('999-00-1111', 'Isabel Garcia', 'Anesthesiology', 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `doctorprofile`
-- (See below for the actual view)
--
CREATE TABLE `doctorprofile` (
`doctor_ssn` varchar(255)
,`doctor_name` varchar(255)
,`specialty` varchar(255)
,`experience` int(11)
,`patient_ssn` varchar(255)
,`patient_name` varchar(255)
,`patient_address` varchar(255)
,`patient_age` int(11)
,`drug_name` varchar(255)
,`qty` int(11)
,`formula` varchar(255)
,`prescription_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `trade_name` varchar(255) NOT NULL,
  `formula` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`trade_name`, `formula`, `company_name`) VALUES
('Amlodipine', 'C20H25ClN2O5', 'CureAll Pharma'),
('Amoxicillin', 'C16H19N3O5S', 'Wellness Labs'),
('Atorvastatin', 'C33H35FN2O5', 'CureAll Pharma'),
('Cetirizine', 'C21H25ClN2O3', 'HealthPlus Pharmaceuticals'),
('Ibuprofen', 'C13H18O2', 'MediCare Pharma'),
('Lisinopril', 'C21H31N3O5', 'LifeSave Pharmaceuticals'),
('Loratadine', 'C22H23ClN2O2', 'HealthPlus Pharmaceuticals'),
('Metformin', 'C4H11N5', 'Wellness Labs'),
('Omeprazole', 'C17H19N3O3S', 'Wellness Labs'),
('Simvastatin', 'C25H38O5', 'MediCare Pharma');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ssn` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `pri_physician_ssn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ssn`, `name`, `address`, `age`, `pri_physician_ssn`) VALUES
('098-76-5432', 'Quincy Adams', '321 Redwood St, Nowheretown, USA', 47, '000-11-2222'),
('109-87-6543', 'Patricia Hernandez', '789 Spruce St, Sometown, USA', 29, '999-00-1111'),
('210-98-7654', 'Oscar Gonzalez', '456 Walnut St, Elsewhere, USA', 38, '666-77-8888'),
('543-21-0987', 'Laura Wilson', '654 Maple St, Hertown, USA', 52, '888-99-0000'),
('765-43-2109', 'Julia Jones', '789 Oak St, Thistown, USA', 30, '666-77-8888'),
('987-65-4321', 'Jane Smith', '123 Main St, Anytown, USA', 45, '123-45-6789');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patientprofile`
-- (See below for the actual view)
--
CREATE TABLE `patientprofile` (
`patient_ssn` varchar(255)
,`patient_name` varchar(255)
,`patient_address` varchar(255)
,`patient_age` int(11)
,`doctor_name` varchar(255)
,`doctor_specialty` varchar(255)
,`drug_name` varchar(255)
,`qty` int(11)
,`prescription_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical_company`
--

CREATE TABLE `pharmaceutical_company` (
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmaceutical_company`
--

INSERT INTO `pharmaceutical_company` (`name`, `phone_number`) VALUES
('CureAll Pharma', '456-789-0123'),
('HealthPlus Pharmaceuticals', '234-567-8901'),
('LifeSave Pharmaceuticals', '567-890-1234'),
('MediCare Pharma', '123-456-7890'),
('Wellness Labs', '345-678-9012');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`name`, `address`, `phone_number`) VALUES
('Apothecare Pharmacy', '852 Cure Close, Cliffside, ST 16117', '555-1616'),
('CarePlus Pharmacy', '456 Care Ave, Shelbysville, ST 67890', '555-5678'),
('GoodHealth Pharmacy', '123 Wellness Rd, Springfield, ST 12345', '555-1234'),
('MediMart Pharmacy', '321 Meds Blvd, Rivertown, ST 13145', '555-1314'),
('Pillbox Pharmacy', '789 Pill St, Oakdale, ST 10112', '555-1011'),
('WellPharm Pharmacy', '654 Health Way, Lakeside, ST 14151', '555-1415');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pharmacyprofile`
-- (See below for the actual view)
--
CREATE TABLE `pharmacyprofile` (
`pharmacy_name` varchar(255)
,`pharmacy_address` varchar(255)
,`pharmacy_phone` varchar(255)
,`drug_trade_name` varchar(255)
,`drug_formula` varchar(255)
,`price` decimal(10,2)
,`contract_start_date` date
,`contract_end_date` date
,`contract_text` text
,`contract_supervisor` varchar(255)
,`company_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `prescribes`
--

CREATE TABLE `prescribes` (
  `doctor_ssn` varchar(255) DEFAULT NULL,
  `drug_trade_name` varchar(255) NOT NULL,
  `drug_company_name` varchar(255) NOT NULL,
  `patient_ssn` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescribes`
--

INSERT INTO `prescribes` (`doctor_ssn`, `drug_trade_name`, `drug_company_name`, `patient_ssn`, `date`, `quantity`) VALUES
('000-11-2222', 'Loratadine', 'HealthPlus Pharmaceuticals', '098-76-5432', '2024-03-20', 10),
('999-00-1111', 'Amlodipine', 'CureAll Pharma', '109-87-6543', '2024-05-30', 30),
('666-77-8888', 'Ibuprofen', 'Medicare Pharma', '210-98-7654', '2024-02-15', 15),
('888-99-0000', 'Metformin', 'Wellness Labs', '543-21-0987', '2024-04-25', 60),
('666-77-8888', 'Simvastatin', 'MediCare Pharma', '765-43-2109', '2024-06-04', 28),
('123-45-6789', 'Amoxicillin', 'Wellness Labs', '987-65-4321', '2024-01-10', 30);

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `pharmacy_name` varchar(255) NOT NULL,
  `drug_trade_name` varchar(255) NOT NULL,
  `drug_company_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`pharmacy_name`, `drug_trade_name`, `drug_company_name`, `price`) VALUES
('Apothecare Pharmacy', 'Simvastatin', 'MediCare Pharma', 15.00),
('CarePlus Pharmacy', 'Ibuprofen', 'Medicare Pharma', 5.00),
('GoodHealth Pharmacy', 'Amoxicillin', 'Wellness Labs', 10.00),
('MediMart Pharmacy', 'Metformin', 'Wellness Labs', 7.20),
('Pillbox Pharmacy', 'Loratadine', 'HealthPlus Pharmaceuticals', 8.50),
('WellPharm Pharmacy', 'Amlodipine', 'CureAll Pharma', 12.75);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('doctor','patient','pharmacist','company') NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `username`, `password_hash`, `role`, `name`) VALUES
(31, 'johndoe', '$2y$10$gSRgE2ux6AdhM3UX.I2fveUCCcMsd8X3ZMsp9FZdHx7diawgU8rX.', 'doctor', 'John Doe'),
(32, 'jacktaylor', '$2y$10$VzDByRBl/VXYL9heL8CkfujXP31DGbJgxy3dMX3t9H4PWkrzvwl5.', 'doctor', 'Jack Taylor'),
(33, 'quincyadams', '$2y$10$XhCafGsQoBK1Xlw5y/OutOwOzb7kwfbNav1XmetkFVSwmkhk5eZzS', 'patient', 'Quincy Adams'),
(34, 'laurawilson', '$2y$10$.EyKECM/EJu6BEX5YRUp5eckpY6psFnuROj4gWwPqcsfxLNacOury', 'patient', 'Laura Wilson'),
(35, 'apothecarepharmacy', '$2y$10$7tKs7uCr3o6E7wL9qjz1yOEMstRmURjzYNNzDCYB2.hNGlxEkUYKK', 'pharmacist', 'Apothecare Pharmacy'),
(36, 'goodhealthpharmacy', '$2y$10$g4HpZpc05vVJLtB3.UqoFOIFDIzxiyVLMNcBpnr9ndcFdXlnFNsyq', 'pharmacist', 'GoodHealth Pharmacy'),
(37, 'medimartpharmacy', '$2y$10$UxW7J0nflqaZmBc6w04ePeb7KIEnh83PBbtR5q1GiwwYjxi1/iXLS', 'pharmacist', 'MediMart Pharmacy'),
(38, 'cureallpharma', '$2y$10$7V4z4aQSTxyHNm7IP8.KiupEsy7PK.S0zXYJJ3i/58IDTU4cjVDwG', 'company', 'CureAll Pharma'),
(39, 'wellnesslabs', '$2y$10$HHXpTqLOEOiXKr3qvf7m2eYUBp2GXTR4DbC7OV/eTL0Hzee2IouQi', 'company', 'Wellness Labs'),
(40, 'partriciahernandez', '$2y$10$.LW87QF3fCbslfFRv95IWujjErzc/9fnkMN1XlEPTl5cyqCX/BBF.', 'patient', 'Patricia Hernandez'),
(41, 'oscargonzalez', '$2y$10$Z3ReZxRlFEXUEQSJSFGlQOkrsDousDlZaqAYmd3i23RVBFz4kbD9C', 'patient', 'Oscar Gonzalez'),
(42, 'juliajones', '$2y$10$fiOtPPQmvCWNc1DZSGOC8eG5i5hN5XY3g2IcQTtFPfnNQirDFlhqi', 'patient', 'Julia Jones'),
(45, 'alicejohnson', '$2y$10$YVprz6aIhzY5wgC7X5mA0.KGN5Gr8VUekHW1VrJB.qo0MgtiEnZCi', 'doctor', 'Alice Johnson'),
(46, 'frankmiller', '$2y$10$Re5sVf1bhUGkXK/c0gFB6eES27h/ST0IfQtHpFuaAk.EvsYIfTsMe', 'doctor', 'Frank Miller'),
(47, 'henrywilson', '$2y$10$lGeHka5M1D.mWohi1FYgquNzg9tIR80iGZZuvA5LneRTUN9YUR0Ea', 'doctor', 'Henry Wilson'),
(48, 'isabelgarcia', '$2y$10$rRr2hvG2kd025LgLYhsA..dHlrBrMPaQbu5jJ.VY4GfV1P.7EOzdK', 'doctor', 'Isabel Garcia'),
(49, 'carepluspharmacy', '$2y$10$eN5T/6QJgcOnfOfazvxyvueHDhXuhcueOKI8H0fixFqAqbap1dBZ2', 'pharmacist', 'CarePlus Pharmacy'),
(50, 'pillboxpharmacy', '$2y$10$411rny1iCj26mc4.VUW2re03pBr76zSiSR.tGXzy4l.uVB5WjejQK', 'pharmacist', 'Pillbox Pharmacy'),
(51, 'wellpharmpharmacy', '$2y$10$USOJKzv6rhMoJB830DvBHuuUjuOeIJw15H6feXtGQMem5MrekZKZC', 'pharmacist', 'WellPharm Pharmacy'),
(52, 'cureallpharma', '$2y$10$S.kXwWdZ/oflXA7PTIEqnenLalgWZqbhpPhus88gbPKW0AwsFUuVe', 'company', 'CureAll Pharma'),
(53, 'healthpluspharmaceuticals', '$2y$10$LsFmVkr9CbIrSuTPLlD5UOsu/jxi.k/faBsxew/cMll.KNQi9ZlRi', 'company', 'HealthPlus Pharmaceuticals'),
(54, 'lifesavepharmaceuticals', '$2y$10$QxRg4Q1yp58JscqYrztoTuyxlYLH05g.He1zxW4q9A1ih0UHvz56K', 'company', 'LifeSave Pharmaceuticals'),
(55, 'medicarepharma', '$2y$10$9yzb6lelrGJRilLFwkY7wu2CtCCTRwVnHYFMLKWigb6rU0/FNxkuS', 'company', 'MediCare Pharma'),
(56, 'wellnesslabs', '$2y$10$Td6WO49Rcljz.FAYlnYVbuUhCVtFwc2DDIC7.ycS7sBYXTE/1kQb.', 'company', 'Wellness Labs');

-- --------------------------------------------------------

--
-- Structure for view `companyprofile`
--
DROP TABLE IF EXISTS `companyprofile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `companyprofile`  AS SELECT `pc`.`name` AS `company_name`, `pc`.`phone_number` AS `company_phone`, `ph`.`name` AS `pharmacy_name`, `ph`.`address` AS `pharmacy_address`, `ph`.`phone_number` AS `pharmacy_phone`, `dr`.`trade_name` AS `drug_trade_name`, `dr`.`formula` AS `formula`, `s`.`price` AS `price`, `c`.`start_date` AS `contract_start_date`, `c`.`end_date` AS `contract_end_date`, `c`.`text` AS `contract_text`, `c`.`supervisor_name` AS `contract_supervisor` FROM ((((`pharmaceutical_company` `pc` join `sells` `s` on(`pc`.`name` = `s`.`drug_company_name`)) join `pharmacy` `ph` on(`s`.`pharmacy_name` = `ph`.`name`)) join `drug` `dr` on(`s`.`drug_trade_name` = `dr`.`trade_name` and `s`.`drug_company_name` = `dr`.`company_name`)) join `contracts` `c` on(`pc`.`name` = `c`.`company_name`)) ;

-- --------------------------------------------------------

--
-- Structure for view `doctorprofile`
--
DROP TABLE IF EXISTS `doctorprofile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doctorprofile`  AS SELECT `d`.`ssn` AS `doctor_ssn`, `d`.`name` AS `doctor_name`, `d`.`specialty` AS `specialty`, `d`.`years_exp` AS `experience`, `p`.`ssn` AS `patient_ssn`, `p`.`name` AS `patient_name`, `p`.`address` AS `patient_address`, `p`.`age` AS `patient_age`, `pr`.`drug_trade_name` AS `drug_name`, `pr`.`quantity` AS `qty`, `dr`.`formula` AS `formula`, `pr`.`date` AS `prescription_date` FROM (((`doctor` `d` join `prescribes` `pr` on(`d`.`ssn` = `pr`.`doctor_ssn`)) join `patient` `p` on(`pr`.`patient_ssn` = `p`.`ssn`)) join `drug` `dr` on(`pr`.`drug_trade_name` = `dr`.`trade_name` and `pr`.`drug_company_name` = `dr`.`company_name`)) ;

-- --------------------------------------------------------

--
-- Structure for view `patientprofile`
--
DROP TABLE IF EXISTS `patientprofile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patientprofile`  AS SELECT `p`.`ssn` AS `patient_ssn`, `p`.`name` AS `patient_name`, `p`.`address` AS `patient_address`, `p`.`age` AS `patient_age`, `d`.`name` AS `doctor_name`, `d`.`specialty` AS `doctor_specialty`, `pr`.`drug_trade_name` AS `drug_name`, `pr`.`quantity` AS `qty`, `pr`.`date` AS `prescription_date` FROM (((`patient` `p` left join `doctor` `d` on(`p`.`pri_physician_ssn` = `d`.`ssn`)) left join `prescribes` `pr` on(`p`.`ssn` = `pr`.`patient_ssn`)) left join `drug` `dr` on(`pr`.`drug_trade_name` = `dr`.`trade_name` and `pr`.`drug_company_name` = `dr`.`company_name`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pharmacyprofile`
--
DROP TABLE IF EXISTS `pharmacyprofile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pharmacyprofile`  AS SELECT `ph`.`name` AS `pharmacy_name`, `ph`.`address` AS `pharmacy_address`, `ph`.`phone_number` AS `pharmacy_phone`, `dr`.`trade_name` AS `drug_trade_name`, `dr`.`formula` AS `drug_formula`, `s`.`price` AS `price`, `c`.`start_date` AS `contract_start_date`, `c`.`end_date` AS `contract_end_date`, `c`.`text` AS `contract_text`, `c`.`supervisor_name` AS `contract_supervisor`, `cp`.`name` AS `company_name` FROM ((((`pharmacy` `ph` join `sells` `s` on(`ph`.`name` = `s`.`pharmacy_name`)) join `drug` `dr` on(`s`.`drug_trade_name` = `dr`.`trade_name`)) join `contracts` `c` on(`ph`.`name` = `c`.`pharmacy_name`)) join `pharmaceutical_company` `cp` on(`s`.`drug_company_name` = `cp`.`name`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`company_name`,`pharmacy_name`),
  ADD KEY `pharmacy_name` (`pharmacy_name`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`trade_name`,`company_name`),
  ADD KEY `company_name` (`company_name`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `pri_physician_ssn` (`pri_physician_ssn`);

--
-- Indexes for table `pharmaceutical_company`
--
ALTER TABLE `pharmaceutical_company`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `prescribes`
--
ALTER TABLE `prescribes`
  ADD PRIMARY KEY (`patient_ssn`,`drug_trade_name`,`drug_company_name`),
  ADD KEY `doctor_ssn` (`doctor_ssn`),
  ADD KEY `drug_trade_name` (`drug_trade_name`,`drug_company_name`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`pharmacy_name`,`drug_trade_name`,`drug_company_name`),
  ADD KEY `drug_trade_name` (`drug_trade_name`,`drug_company_name`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`company_name`) REFERENCES `pharmaceutical_company` (`name`),
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`pharmacy_name`) REFERENCES `pharmacy` (`name`);

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`company_name`) REFERENCES `pharmaceutical_company` (`name`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`pri_physician_ssn`) REFERENCES `doctor` (`ssn`);

--
-- Constraints for table `prescribes`
--
ALTER TABLE `prescribes`
  ADD CONSTRAINT `prescribes_ibfk_1` FOREIGN KEY (`doctor_ssn`) REFERENCES `doctor` (`ssn`),
  ADD CONSTRAINT `prescribes_ibfk_2` FOREIGN KEY (`patient_ssn`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `prescribes_ibfk_3` FOREIGN KEY (`drug_trade_name`,`drug_company_name`) REFERENCES `drug` (`trade_name`, `company_name`);

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`pharmacy_name`) REFERENCES `pharmacy` (`name`),
  ADD CONSTRAINT `sells_ibfk_2` FOREIGN KEY (`drug_trade_name`,`drug_company_name`) REFERENCES `drug` (`trade_name`, `company_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
