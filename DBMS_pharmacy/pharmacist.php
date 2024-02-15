<?php
require_once('database_connection.php');

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $conn->begin_transaction();

    try {
        $name = $_SESSION['name'];
        $pharmacy_address = $_POST['pharmacy_address'];
        $pharmacy_phone = $_POST['pharamcy_phone'];

        $stmt = $conn->prepare("INSERT INTO pharmacy (name, address, Phone_number) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $pharmacy_address ,$pharmacy_phone);
        $stmt->execute();
        $conn->commit();
        $stmt->close();
        $conn->close();
        header('Location: loginpage.html');
        echo "Pharmacy registered successfully";

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed" . $e->getMessage();
        exit();
    }

}
    
?>