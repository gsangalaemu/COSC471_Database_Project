<?php
include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Performing Artist</title>
</head>
<body>

<h2>Add Performing Artist</h2>

<form method="POST">

    <label>Song ID:</label>
    <input type="number" name="song_id" required><br><br>

    <label>Featured Artist ID:</label>
    <input type="number" name="featured_artist" required><br><br>

    <button type="submit">Submit</button>

</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $song = $_POST['song_id'];
    $featured = $_POST['featured_artist'];

    $sql = "INSERT INTO performing_artist (Song_id, Featured_artist)
            VALUES ('$song', '$featured')";

    if (mysqli_query($conn, $sql)) {
        echo "Performing artist added successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>
