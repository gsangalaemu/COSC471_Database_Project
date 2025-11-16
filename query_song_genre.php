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
$genre = $_POST['querySongGenre'];

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
$sql = "SELECT A.Artist_name, S.Song_name, S.Year, G.Genre_name, S.Song_id,
               GROUP_CONCAT(B.Album_name) AS Album_name,
               GROUP_CONCAT(FA.Artist_name) AS Performing_artist
        FROM ARTISTS AS A
        JOIN SONGS AS S ON S.Album_artist = A.Artist_id
        LEFT JOIN PERFORMING_ARTIST AS PA ON PA.Song_id = S.Song_id
        LEFT JOIN ARTISTS AS FA ON FA.Artist_id = PA.Featured_artist
        JOIN GENRES AS G ON G.Genre_id = S.Genre
        JOIN SONG_ALBUMS AS SA ON SA.Song_id = S.Song_id
        JOIN ALBUMS AS B ON B.Album_id = SA.Album_id
        WHERE G.Genre_name COLLATE utf8_unicode_ci = ?
        GROUP BY S.Song_id";

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
            <th>Genre</th>
            <th>Album  Artist</th>
            <th>Featured Artist(s)</th>
            <th>Song</th>
            <th>Appears On</th>
            <th>Year</th>            
        </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>" .
        "<td>" . $row["Genre_name"] . "</td>" .
        "<td>" . $row["Artist_name"] . "</td>" .
        "<td>" . $row["Performing_artist"] . "</td>" .
        "<td>" . $row["Song_name"] . "</td>" .
        "<td>" . $row["Year"] . "</td>" .
        "<td>" . $row["Album_name"] . "</td>" .
        "</tr>";
    }
    echo "</table>";
} else {
    echo "<li>No matching results</li>";
}
// Close the connection to the datebase
$conn->close();

?>