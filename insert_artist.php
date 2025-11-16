<?php include 'db_connection.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Add Artist</title>
</head>
<body>

<h2>Add Artist</h2>

<form method="POST">
    <label>Artist Name:</label>
    <input type="text" name="artist_name" required><br><br>

    <button type="submit">Submit</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name = $_POST['artist_name'];

    $sql = "INSERT INTO artists (Artist_name) VALUES ('$name')";

    if (mysqli_query($conn, $sql)) {
        echo "Artist added successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>
