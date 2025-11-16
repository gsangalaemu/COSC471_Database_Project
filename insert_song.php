<?php
include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Song</title>
</head>
<body>

<h2>Add Song</h2>

<form method="POST">

    <label>Song Name:</label>
    <input type="text" name="song_name" required><br><br>

    <label>Album Artist (Artist_id):</label>
    <input type="number" name="album_artist" required><br><br>

    <label>Song Length (ex: 3:45):</label>
    <input type="text" name="song_length"><br><br>

    <label>Genre:</label>
    <input type="text" name="genre"><br><br>

    <label>Year:</label>
    <input type="number" name="year"><br><br>

    <button type="submit">Submit</button>

</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $song_name = $_POST['song_name'];
    $album_artist = $_POST['album_artist'];
    $song_length = $_POST['song_length'];
    $genre = $_POST['genre'];
    $year = $_POST['year'];

    $sql = "INSERT INTO songs (Song_name, Album_artist, Song_length, Genre, Year)
            VALUES ('$song_name', '$album_artist', '$song_length', '$genre', '$year')";

    if (mysqli_query($conn, $sql)) {
        echo "Song added successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>
