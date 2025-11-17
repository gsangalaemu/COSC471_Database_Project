<?php
include 'db_connection.php';

// The artist the user input
$genre = $_POST['querySongGenre'];

// We want to print the artist name, the album name, the release date, and the genre.
// We have to join quite a few tables to be able to print all the data that we want
// GROUP_CONCAT is needed so that songs that appear on multiple albums will list
// all albums the song appears on, as well as songs that have multiple
// featured/guest/performing artists all appear in one cell.
// The COLLATE is needed to ignore case sensitivity issues
$sql = "SELECT A.Artist_name, S.Song_name, S.Release.year, G.Genre_name, S.Song_id,
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