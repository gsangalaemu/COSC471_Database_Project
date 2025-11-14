<?php
// The book uses a very old and outdated method of connecting to a SQL
// database with PHP. Looking at the W3 Schools articles and a little more
// Googling, I think this is the best way to set it up.

// Database info
$host = "127.0.0.1";
$user = "root";
$password = "";
$database = "song_sleuth";

$artist = $_POST['queryAlbumArtist'];

// Create connection to database
$conn = new mysqli($host, $user, $password, $database);

// Output an error if the connection to the database fails
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// We want to print the artist name, the album name, the release date, and the genre.
// We need to join the ARTISTS and ALBUMS tables on the Artist_id column
// We also need to join GENRES and ALBUM_GENRES tables on th Genre_id column
// We finally need to join the ALBUMS and ALBUM_GENRES tables on the Album_id column
// GROUP_CONCAT is used so that albums with multiple genres will display all genres
$sql = "SELECT Artist_name, Album_name, Release_date, 
               GROUP_CONCAT(Genre_name) AS Genre
        FROM ARTISTS AS A, ALBUMS AS B,
             GENRES AS G, ALBUM_GENRES AS L
        WHERE A.Artist_id = B.Album_artist
              AND G.Genre_id = L.Genre_id
              AND B.Album_id = L.Album_id
              AND Artist_name = ?
        GROUP BY B.Album_id";

// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $artist);
$stmt->execute();
$result = $stmt->get_result();

?>

<!DOCTYPE html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<?php
if ($result->num_rows> 0) {
    echo "<h1>" . "Albums by " . $artist . "</h1>";
    echo "<table>
        <tr>
            <th>Artist</th>
            <th>Album</th>
            <th>Release Date</th>
            <th>Genre</th>
        </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>" .
        "<td>" . $row["Artist_name"] . "</td>" .
        "<td>" . $row["Album_name"] . "</td>" .
        "<td>" . $row["Release_date"] . "</td>" .
        "<td>" . $row["Genre"] . "</td>" .
        "</tr>";
    }
    echo "</table>";
} else {
    echo "<li>No matching results</li>";
}
?>

</body>
</html>
<?php

// Close the connection to the datebase
$conn->close();

?>