<?php
// database_connection.php

$host = 'localhost'; // Database host
$db_username = 'root'; // Database username
$db_password = ''; // Database password
$db_name = 'hospital'; // Database name

// Create a new connection to the MySQL database
$conn = new mysqli($host, $db_username, $db_password, $db_name);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// The connection is now established and can be used in other scripts by including this file.
