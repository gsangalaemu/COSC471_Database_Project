<?php
// Database info
$host = "127.0.0.1";
$user = "root";
$password = "";
$database = "song_sleuth";

// Create connection to database
$conn = new mysqli($host, $user, $password, $database);

// Output an error if the connection to the database fails
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Testing the SQL query with a hardcoded insert, will need to change later
$sql = "INSERT INTO ARTISTS(Artist_name)
        VALUES ('John Coltrane')";
?>

<!DOCTYPE html>
<head></head>
<body>

<?php
if ($conn->query($sql) === TRUE) {
    echo "Artist inserted succesfully";
} else {
    echo "Insert failed";
}
?>

</body>
</html>
<?php

// Close the connection to the datebase
$conn->close();

?>