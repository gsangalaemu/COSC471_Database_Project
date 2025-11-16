<?php
include 'db_connection.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Genre</title>
</head>
<body>

<h2>Add Genre</h2>

<form method="POST">
    <label>Genre Name:</label>
    <input type="text" name="genre_name" required><br><br>

    <button type="submit">Submit</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $genre_name = $_POST['genre_name'];

    // Correct table name is 'genres'
    $sql = "INSERT INTO genres (Genre_name)
            VALUES ('$genre_name')";

    if (mysqli_query($conn, $sql)) {
        echo "Genre added successfully.";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>

</body>
</html>

