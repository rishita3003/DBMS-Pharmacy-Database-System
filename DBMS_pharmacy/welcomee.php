<?php
session_start();

require_once('database_connection.php');

// Check if the user is logged in, otherwise redirect to login page
/*if (!isset($_SESSION['username']) || empty($_SESSION['username'])) {
    header("location: login.php");
    exit;
}*/

$role = $_SESSION['role'];
$username = $_SESSION['username'];
$name = $_SESSION['name'];


$patient_details = [];
$doctor_details = [];
$company_details = [];
$pharmacy_details = [];

if ($role == 'patient'){
    $sql = $conn->prepare("SELECT * FROM patientprofile WHERE patient_name = ?");

    $sql->bind_param("s", $name);

    $sql->execute();
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
       while ($row = $result->fetch_assoc()) {
           $patient_details[] = $row;
       }
    
    } else {
    echo "No user found with that username";
    echo $username;
    }
} else if ($role == "doctor"){
    $sql = $conn->prepare("SELECT * FROM doctorprofile WHERE doctor_name = ?");
    $sql->bind_param("s", $name);
    $sql->execute();
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $doctor_details[] = $row;
        }

    } else {
    echo "No user found with that username";
    
    }
} else if ($role == 'company'){
    $sql = $conn->prepare("SELECT * FROM companyprofile WHERE company_name = ?");
    $sql->bind_param("s", $name);
    $sql->execute();
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $company_details[] = $row;
        }

    } else {
    echo "No user found with that username";
    
    }

} else if ($role == "pharmacist"){
    $sql = $conn->prepare("SELECT * FROM pharmacyprofile WHERE pharmacy_name = ?");
    $sql->bind_param("s", $name);
    $sql->execute();
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $pharmacy_details[] = $row;
        }

    } else {
    echo "No user found with that username";   
    }
} 
else {
    echo "Invalid role detected. Please contact support.";
    exit;
}

$sql->close();
$conn->close();


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="stylehome.css">
    <title>Profile</title>
</head>
<body>
    <nav class="container-fluid">
        <ul>
            <li><strong>Profile</strong></li>
        </ul>
        <ul>
            <li><a href="help.html">Help</a></li>
            <li><a href="about.html" role="button">About</a></li>
            <li><a href="logout.php" role="button">Logout</a></li>
        </ul>
    </nav>
    <main class="container">
        <div class="grid">
            <section>
                <?php if ($role == 'patient'): ?>
                    <h1>Your Details</h1>
                    <div class="card">
                        <p><strong>SSN:</strong> <?php echo $patient_details[0]['patient_ssn']; ?></p>
                        <p><strong>Name:</strong> <?php echo $patient_details[0]['patient_name']; ?></p>
                        <p><strong>Address:</strong> <?php echo $patient_details[0]['patient_address']; ?></p>
                        <p><strong>Age:</strong> <?php echo $patient_details[0]['patient_age']; ?> years</p>
                    </div>
                    <h2>Primary Physician Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Specialization</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?php echo $patient_details[0]['doctor_name']; ?></td>
                                <td><?php echo $patient_details[0]['doctor_specialty']; ?></td>
                            </tr>
                        </tbody>
                    </table>

                    <h2>Prescription Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name of Drug</th>
                                <th>Prescription Date</th>
                                <th>Quantity</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($patient_details as $patient): ?>
                                <tr>
                                    <td><?php echo $patient['drug_name']; ?></td>
                                    <td><?php echo $patient['prescription_date']; ?></td>
                                    <td><?php echo $patient['qty']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php elseif ($role == 'doctor'): ?>
                    <h1>Your Details</h1>
                    <div class="card">
                        <p><strong>SSN:</strong> <?php echo $doctor_details[0]['doctor_ssn']; ?></p>
                        <p><strong>Name:</strong> <?php echo $doctor_details[0]['doctor_name']; ?></p>
                        <p><strong>Specialization:</strong> <?php echo $doctor_details[0]['specialty']; ?></p>
                        <p><strong>Experience:</strong> <?php echo $doctor_details[0]['experience']; ?> years</p>
                    </div>
                    <h2>Patient Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Age</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($doctor_details as $patient): ?>
                                <tr>
                                    <td><?php echo $patient['patient_name']; ?></td>
                                    <td><?php echo $patient['patient_address']; ?></td>
                                    <td><?php echo $patient['patient_age']; ?> years</td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>

                    <h2>Prescription Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name of Drug</th>
                                <th>Prescription Date</th>
                                <th>Quantity</th>
                                <th>Formula</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($doctor_details as $patient): ?>
                                <tr>
                                    <td><?php echo $patient['drug_name']; ?></td>
                                    <td><?php echo $patient['prescription_date']; ?></td>
                                    <td><?php echo $patient['qty']; ?></td>
                                    <td><?php echo $patient['formula']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php elseif ($role == 'company'): ?>
                    <h1>Your Details</h1>
                    <div class="card">
                        <p><strong>Name:</strong> <?php echo $name; ?></p>
                        <p><strong>Phone Number:</strong> <?php echo $company_details[0]['company_phone']; ?></p>
                    </div>
                    <h2>Company Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Drug Name</th>
                                <th>Price</th>
                                <th>Pharmacy name</th>
                                <th>Formula</th>
                                <th>Pharmacy Address</th>
                                <th>Pharmacy Phone</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($company_details as $company): ?>
                                <tr>
                                    <td><?php echo $company['drug_trade_name']; ?></td>
                                    <td><?php echo $company['price'], "$"; ?></td>
                                    <td><?php echo $company['pharmacy_name']; ?></td>
                                    <td><?php echo $company['formula']; ?></td>
                                    <td><?php echo $company['pharmacy_address']; ?></td>
                                    <td><?php echo $company['pharmacy_phone']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    <h2>Contract Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Pharmacy Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Text</th>
                                <th>Supervisor Name</th>
                            </th>
                            </thead>
                        <tbody>
                            <?php foreach ($company_details as $pharmacy): ?>
                                <tr>
                                    <td><?php echo $pharmacy['pharmacy_name']; ?></td>
                                    <td><?php echo $pharmacy['contract_start_date']; ?></td>
                                    <td><?php echo $pharmacy['contract_end_date']; ?></td>
                                    <td><?php echo $pharmacy['contract_text']; ?></td>
                                    <td><?php echo $pharmacy['contract_supervisor']; ?></td>
                            </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>

                <?php elseif ($role == 'pharmacist'): ?>
                    <h1>Your Details</h1>
                    <div class="card">
                        <p><strong>Name:</strong> <?php echo $name; ?></p>
                        <p><strong>Phone Number:</strong> <?php echo $pharmacy_details[0]['pharmacy_phone']; ?></p>
                    </div>
                    <h2>Pharmacy Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Pharmacy Address</th>
                                <th>Drug Name</th>
                                <th>Price</th>
                                <th>Formula</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($pharmacy_details as $pharmacy): ?>
                                <tr>
                                    <td><?php echo $pharmacy['pharmacy_address']; ?></td>
                                    <td><?php echo $pharmacy['drug_trade_name']; ?></td>
                                    <td><?php echo $pharmacy['price'], "$"; ?></td>
                                    <td><?php echo $pharmacy['drug_formula']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    <h2>Contract Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Text</th>
                                <th>Supervisor Name</th>
                            </th>
                            </thead>
                    
                        <tbody>
                            <?php foreach ($pharmacy_details as $pharmacy): ?>
                                <tr>                                    
                                    <td><?php echo $pharmacy['company_name']; ?></td>
                                    <td><?php echo $pharmacy['contract_start_date']; ?></td>
                                    <td><?php echo $pharmacy['contract_end_date']; ?></td>
                                    <td><?php echo $pharmacy['contract_text']; ?></td>
                                    <td><?php echo $pharmacy['contract_supervisor']; ?></td>
                            </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>               
                <?php endif; ?>
            </section>
        </div>
    </main>
</body>
</html>