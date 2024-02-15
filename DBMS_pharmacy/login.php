<?php
session_start();

require_once('database_connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];


    $sql = $conn->prepare("SELECT * FROM Userlogin WHERE username = ?");
    $sql->bind_param("s", $username);
    $sql->execute();
    $result = $sql->get_result();
    
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password_hash'])) {
            $_SESSION['id'] = $row['id'];
            $_SESSION['role'] = $row['role'];
            $_SESSION['name'] = $row['name'];
            $_SESSION['username'] = $username;
            
            header('Location:welcomee.php');
        } else {
            echo "Invalid username or password";
        }
    } else {
        echo "No user found with that username";
    }

    $sql->close();
    $conn->close();

}
?>