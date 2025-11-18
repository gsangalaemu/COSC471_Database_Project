<?php
include 'db_connection.php';

// The artist the user input
$artist = $_POST['queryAlbumArtist'];

// We want to print the artist name, the album name, the release date, and the genre.
// We need to join the ARTISTS and ALBUMS tables on the Artist_id column
// We also need to join GENRES and ALBUM_GENRES tables on th Genre_id column
// We finally need to join the ALBUMS and ALBUM_GENRES tables on the Album_id column
// GROUP_CONCAT is used so that albums with multiple genres will display all genres
// The COLLATE is needed to ignore case sensitivity issues
$sql = "SELECT Artist_name, Album_name, Release_date, 
               GROUP_CONCAT(Genre_name SEPARATOR ', ') AS Genre
        FROM ARTISTS AS A
        JOIN ALBUMS AS B ON A.Artist_id = B.Album_artist
        LEFT JOIN ALBUM_GENRES AS AG ON B.Album_id = AG.Album_id
        LEFT JOIN GENRES AS G ON AG.Genre_id = G.Genre_id
        WHERE Artist_name COLLATE utf8_unicode_ci = ?
        GROUP BY B.Album_id
        ORDER BY Release_date";

// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $artist);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows> 0) {
    // Print a table of results
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

// Close the connection to the datebase
$conn->close();

?>