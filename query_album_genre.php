<?php
include 'db_connection.php';

// The artist the user input
$genre = $_POST['queryAlbumGenre'];

// We want to print the artist name, the album name, the release date, and the genre.
// We have to join quite a few tables to be able to print all the data that we want
// The inner query is needed to be able to select the albums that match the user
// input genre, and then we can print the properly formatted results with multiple
// genres.
// GROUP_CONCAT is used so that albums with multiple genres will display all genres,
// not just the genre the user searched, in a single cell.
// The COLLATE is needed to ignore case sensitivity issues
$sql = "SELECT A.Artist_name, B.Album_name, B.Release_date, 
               GROUP_CONCAT(G.Genre_name) AS Genre
        FROM ARTISTS AS A
        JOIN ALBUMS AS B ON B.Album_artist = A.Artist_id
        JOIN ALBUM_GENRES AS AG ON AG.Album_id = B.Album_id
        JOIN GENRES AS G ON G.Genre_id = AG.Genre_id        
        WHERE B.Album_id IN (SELECT BI.Album_id
                             FROM ARTISTS AS AI
                             JOIN ALBUMS AS BI ON BI.Album_artist = AI.Artist_id
                             JOIN ALBUM_GENRES AS AGI ON AGI.Album_id = BI.Album_id
                             JOIN GENRES AS GI ON GI.Genre_id = AGI.Genre_id        
        WHERE Genre_name COLLATE utf8_unicode_ci = ?)
        GROUP BY B.Album_id";

// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $genre);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows> 0) {
    // Print a table of results
    echo "<h1>" . "Albums matching " . $genre . "</h1>";
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