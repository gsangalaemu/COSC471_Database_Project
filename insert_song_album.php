<?php
include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Link Song to Album</title>
</head>
<body>

<h2>Link Song to Album</h2>

<form method="POST">

    <label>Song ID:</label>
    <input type="number" name="song_id" required><br><br>

    <label>Album ID:</label>
    <input type="number" name="album_id" required><br><br>

    <label>Track Number:</label>
    <input type="number" name="track_number"><br><br>

    <button type="submit">Submit</button>

</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $song_id = $_POST['song_id'];
    $album_id = $_POST['album_id'];
    $track_number = $_POST['track_number'];

    $sql = "INSERT INTO song_albums (Song_id, Album_id, Track_number)
            VALUES ('$song_id', '$album_id', '$track_number')";

    if (mysqli_query($conn, $sql)) {
        echo "Song linked to album successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>
