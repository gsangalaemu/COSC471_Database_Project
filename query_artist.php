<?php
// The book uses a very old and outdated method of connecting to a SQL
// database with PHP. Looking at the W3 Schools articles and a little more
// Googling, I think this is the best way to set it up.

// Database info
$host = "127.0.0.1";
$port = 3307;
$user = "root";
$password = "";
$database = "song_sleuth";

// Create connection to database
$conn = new mysqli($host, $user, $password, $database, $port);

// Output an error if the connection to the database fails
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Testing the SQL query with a SELECT ALL, will need to be changed
// to user input artist name later
$sql = "SELECT * 
        FROM ARTISTS";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<head></head>
<body>

<ul>
<?php
if ($result->num_rows> 0) {
    echo "<h1>" . "Artist List" . "</h1>";
    while ($row = $result->fetch_assoc()) {
        echo "<li>" . "Artist name: " . htmlspecialchars($row["Artist_name"]) . "</li>";
    }
} else {
    echo "<li>No matching results</li>";
}
?>
</ul>

</body>
</html>
<?php

// Close the connection to the datebase
$conn->close();

?>