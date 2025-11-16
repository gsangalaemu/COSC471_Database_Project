<?php
// The book uses a very old and outdated method of connecting to a SQL
// database with PHP. Looking at the W3 Schools articles and a little more
// Googling, I think this is the best way to set it up.

// Database info
$host = "127.0.0.1";
$user = "root";
$password = "";
$database = "song_sleuth";

// The artist the user input
$genre = $_POST['queryAlbumGenre'];

// Create connection to database
$conn = new mysqli($host, $user, $password, $database);

// Output an error if the connection to the database fails
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// We want to print the artist name, the album name, the release date, and the genre.
// We have to join quite a few tables to be able to print all the data that we want
// GROUP_CONCAT is used so that albums with multiple genres will display all genres
// The COLLATE is needed to ignore case sensitivity issues
$sql = "SELECT Artist_name, Album_name, Release_date, 
               GROUP_CONCAT(Genre_name) AS Genre
        FROM ARTISTS AS A, ALBUMS AS B,
             GENRES AS G, ALBUM_GENRES AS L
        WHERE A.Artist_id = B.Album_artist
              AND G.Genre_id = L.Genre_id
              AND B.Album_id = L.Album_id
              AND Genre_name COLLATE utf8_unicode_ci = ?
        GROUP BY B.Album_id";

// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $genre);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows> 0) {
    // Print a table of results
    echo "<h1>" . "Songs matching " . $genre . "</h1>";
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

// Close the connection to the datebase
$conn->close();

?>