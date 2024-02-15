<?php
session_start();
require_once('database_connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name= $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $password_hash = password_hash($password, PASSWORD_DEFAULT);
    if (!empty($_POST['role'])) {
        $role = $_POST['role'];
   
    $conn->begin_transaction();

    try {
        $stmt = $conn->prepare("INSERT INTO Userlogin (username, password_hash,role, name) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $username, $password_hash, $role,$name);
        $stmt->execute();
        $conn->commit();

        $_SESSION['id'] = $stmt->insert_id;
        $_SESSION['role'] = $role;
        $_SESSION['name'] = $name;
        
        $stmt->close();
        $conn->close();

        switch ($role) {
            case 'doctor':
                header('Location: doctor_registration.html');
                break;
            case 'patient':
                header('Location: patient_registration.html');
                break;
            case 'company':
                header('Location: company_registration.html');
                break;
            case 'pharmacist':
                header('Location: pharmacist_registration.html');
                break;
        }

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed" . $e->getMessage();
        exit();
    }
}
}
?>