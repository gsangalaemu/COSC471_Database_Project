<?php
include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Link Album to Genre</title>
</head>
<body>

<h2>Add Genre to Album</h2>

<form method="POST">
    <label>Album ID:</label>
    <input type="number" name="album_id" required><br><br>

    <label>Genre ID:</label>
    <input type="number" name="genre_id" required><br><br>

    <button type="submit">Submit</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $album = $_POST['album_id'];
    $genre = $_POST['genre_id'];

    $sql = "INSERT INTO album_genre (Album_id, Genre_id)
            VALUES ('$album', '$genre')";

    if (mysqli_query($conn, $sql)) {
        echo "Genre linked to album successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>

