<?php
include 'db_connection.php';

// The song the user input
$albumName = $_POST['albumName'];
$albumArtist = $_POST['albumArtist'];
$albumRelease = $_POST['albumRelease'];
$albumGenre = $_POST['albumGenre'];

// Make sure that the artist the user is adding exists in the ARTIST table,
// else print an error asking them to add the artist first
$sql = "SELECT Artist_id
        FROM ARTISTS
        WHERE Artist_name COLLATE utf8_unicode_ci = ?";
        
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $albumArtist);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $aa_id = $row["Artist_id"];
    } 
} else {
        echo "Provided artist \"" . $albumArtist . "\" not found, please add to Artist table first!";
}

// Insert the new album into the ALBUMS table if the artist exists
if (!empty($aa_id)) {
    $sql = "INSERT INTO ALBUMS(Album_name, Album_artist)
        VALUES(?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $albumName, $aa_id);
    $stmt->execute();

    echo $albumName . " by " . $albumArtist . " successfully added to the database!\n\n";

    // Track the auto-incremented pk of the new song
    // We'll use this for the other INSERT opererations
    $album_id = $conn->insert_id;

    // We have a few optional fields for the album. First we'll update ones
    // that are directly on the ALBUMS table and don't involve any fks
   
    // UPDATE Release Date
    if(!empty($aa_id) && !empty($albumRelease)) {
       
        // Make sure that the user input a valid release date format
        // Acceptable date formate are:
        // YYYY
        // YYYY-MM
        // YYYY-MM-DD
        $albumReleaseStringLength = strlen($albumRelease);        
        $validReleaseDate = true; // Assume true
        switch ($albumReleaseStringLength) {
            case 4:
                $format = 'Y';
                break;                
            case 7:
                $format = 'Y-m';
                break;
            case 10:
                $format = 'Y-m-d';
                break;
            default:
                echo "Invalid album release date format. Enter as YYYY or YYYY-MM or YYYY-MM-DD.";
                $validReleaseDate = false; // Set false on failure
                break;
        }
  
        if ($validReleaseDate) {
            $albumReleaseFormatted = DateTime::createFromFormat($format, $albumRelease);
            if ($albumReleaseFormatted === false) {
                echo "Invalid album release date format. Enter as YYYY or YYYY-MM or YYYY-MM-DD.";
            } else {
                // If the date format is valid then UPDATE the ALBUM table entry for the ablum
                $sql = "UPDATE ALBUMS
                        SET Release_date = ?
                        WHERE Album_id = ?";

                $stmt = $conn->prepare($sql);
                $stmt->bind_param("si", $albumRelease, $album_id);
                $stmt->execute();

                echo "Set album release date to " . $albumRelease . "\n\n";
            }      
        }     
    }

    // Add the genre for the album
    if (!empty($aa_id) && !empty($albumGenre)) {
        // Seperate multilple genres into an array
        $genreArray = explode(",", $albumGenre);

        foreach ($genreArray as $genre) {

            $genre = trim($genre); // Trim leading annd trailing white space

            // Make sure the genre exists
            $sql = "SELECT Genre_id
                    FROM GENRES
                    WHERE Genre_name COLLATE utf8_unicode_ci = ?";

            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $genre);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $albumGenre_id = $row["Genre_id"];
                } 

                $sql = "INSERT INTO ALBUM_GENRES(Album_id, Genre_id)
                        VALUES(?, ?)";

                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ii", $album_id, $albumGenre_id);
                $stmt->execute();    
                
                echo "Added " . $genre . " as a genre\n\n";
            } else {
            echo "Provided genre \"" . $genre . "\" not found, please select a valid genre!\n\n";
            }
    }        
    }   
    
}

// Close the connection to the datebase
$conn->close();

?>