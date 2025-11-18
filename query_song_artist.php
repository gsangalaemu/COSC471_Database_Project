<?php
include 'db_connection.php';

// The artist the user input
$artist = $_POST['querySongArtist'];

// We want to print the artist name, the album name, the release date, and the genre.
// We have to join quite a few tables to be able to print all the data that we want
// The LEFT JOINs are needed so that we can properly search both the primary and
// guest/featured/performing artists for a song.
// GROUP_CONCAT is needed so that songs that appear on multiple albums will list
// all albums the song appears on, as well as songs that have multiple
// featured/guest/performing artists all appear in one cell.
// The COLLATE is needed to ignore case sensitivity issues
$sql = "SELECT A.Artist_name, S.Song_name, S.Release_year, G.Genre_name, S.Song_length,
               GROUP_CONCAT(B.Album_name SEPARATOR ', ') AS Album_name,
               GROUP_CONCAT(FA.Artist_name SEPARATOR ', ') AS Performing_artist
        FROM ARTISTS AS A
        JOIN SONGS AS S ON S.Album_artist = A.Artist_id
        LEFT JOIN PERFORMING_ARTIST AS PA ON PA.Song_id = S.Song_id
        LEFT JOIN ARTISTS AS FA ON FA.Artist_id = PA.Featured_artist
        LEFT JOIN GENRES AS G ON G.Genre_id = S.Genre
        LEFT JOIN SONG_ALBUMS AS SA ON SA.Song_id = S.Song_id
        LEFT JOIN ALBUMS AS B ON B.Album_id = SA.Album_id
        WHERE A.Artist_name COLLATE utf8_unicode_ci = ?
              OR PA.Featured_artist IN (SELECT Artist_id
                                        FROM ARTISTS
                                        WHERE Artist_name COLLATE utf8_unicode_ci = ?)
        GROUP BY S.Song_id
        ORDER BY S.Release_year";


// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $artist, $artist);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows> 0) {
    // Print a table of results
    echo "<h1>" . "Songs " . $artist . " performs on" . "</h1>";
    echo "<table>
        <tr>
            <th>Album  Artist</th>
            <th>Featured Artist(s)</th>
            <th>Song</th>
            <th>Length</th>
            <th>Year</th>
            <th>Appears On</th>
            <th>Genre</th>
        </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>" .
        "<td>" . $row["Artist_name"] . "</td>" .
        "<td>" . $row["Performing_artist"] . "</td>" .
        "<td>" . $row["Song_name"] . "</td>" .
        "<td>" . $row["Song_length"] . "</td>" .  
        "<td>" . $row["Release_year"] . "</td>" .
        "<td>" . $row["Album_name"] . "</td>" .
        "<td>" . $row["Genre_name"] . "</td>" .
        "</tr>";
    }
    echo "</table>";
} else {
    echo "<li>No matching results</li>";
}
// Close the connection to the datebase
$conn->close();

?>