<?php
$host = "127.0.0.1";
$user = "root";
$pass = ""; 
$db   = "song_sleuth";

// Create new connection 
$conn = new mysqli($host, $user, $pass, $db);

// Kill connection if error is thrown 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
