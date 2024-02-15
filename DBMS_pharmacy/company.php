<?php
require_once('database_connection.php');

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $conn->begin_transaction();

    try {
        $rep_name = $_SESSION['name'];
        $company_name = $_POST['company_name'];
        $company_phone = $_POST['company_phone'];

        $stmt = $conn->prepare("INSERT INTO pharmaceutical_company (name, phone_number) VALUES (?, ?)");
        $stmt->bind_param("ss", $company_name, $company_phone);
        $stmt->execute();
        $conn->commit();
        $stmt->close();
        $conn->close();
        header('Location: loginpage.html');
        echo "Company Rep registered successfully";

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed" . $e->getMessage();
        exit();
    }

}
    
?>