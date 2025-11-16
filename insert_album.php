<?php
include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Album</title>
</head>
<body>

<h2>Add Album</h2>

<form method="POST">
    <label>Album Name:</label>
    <input type="text" name="album_name" required><br><br>

    <label>Album Artist ID:</label>
    <input type="number" name="album_artist" required><br><br>

    <label>Release Date:</label>
    <input type="date" name="release_date"><br><br>

    <label>Album Art (optional path or filename):</label>
    <input type="text" name="album_art"><br><br>

    <button type="submit">Submit</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name   = $_POST['album_name'];
    $artist = $_POST['album_artist'];
    $date   = $_POST['release_date'];
    $art    = $_POST['album_art'];

    $sql = "INSERT INTO albums (Album_artist, Album_name, Release_date, Album_art)
            VALUES ('$artist', '$name', '$date', '$art')";

    if (mysqli_query($conn, $sql)) {
        echo "Album added successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>
