<?php
include 'db_connection.php';

// The song the user input
$songName = $_POST['songName'];
$songAlbumArtist = $_POST['songAlbumArtist'];
$songAlbum = $_POST['songAlbum'];
$trackNum = $_POST['trackNum'];
$performingArtist = $_POST['performingArtist'];
$songGenre = $_POST['songGenre'];
$songYear = $_POST['songYear'];
$songLength = $_POST['songLength'];

// Make sure that the artist the user is adding exists in the ARTIST table,
// else print an error asking them to add the artist first
$sql = "SELECT Artist_id
        FROM ARTISTS
        WHERE Artist_name COLLATE utf8_unicode_ci = ?";
        
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $songAlbumArtist);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $aa_id = $row["Artist_id"];
    } 
} else {
        echo "Provided artist " . $songAlbumArtist . " not found, please add to Artist table first!";
}

// Insert the new song into the SONGS table if the artist exists
if (!empty($aa_id)) {
    $sql = "INSERT INTO SONGS(Song_name, Album_artist)
        VALUES(?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $songName, $aa_id);
    $stmt->execute();


    echo $songName . " successfully added to the database!\n\n";

    // Track the auto-incremented pk of the new song
    // We'll use this for the other INSERT opererations
    $song_id = $conn->insert_id;

    // There are many optional fields the user may have filled out, we'll check them in groups
    // First we'll check those that belong on the SONGS table directly and don't involve any fks
   
    // UPDATE Year
    if(!empty($aa_id) && !empty($songYear)) {
        
        // PHP converts Strings that start with non-numerics to the integer 0
        // So this is kinda a dirty way to make sure the user input an integer
        $yearValidInt = true; // Assume true
        $songYear = (int)$songYear;

        if ($songYear == 0) {
            echo "Year must be an integer value.\n\n";            
            $yearValidInt = false; // Set false on failure
        }

        if ($yearValidInt) {
            $sql = "UPDATE SONGS AS S
                    SET Release_year = ?
                    WHERE Song_id = ?";            

            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $songYear, $song_id);
            $stmt->execute();

            echo "Successfully set song release year to " . $songYear . "\n\n";
        }        
    }

    // UPDATE Song Length
    if (!empty($aa_id) && !empty($songLength)) {
        $format = 'H:i:s';
        $songLengthFormatted = DateTime::createFromFormat($format, $songLength);
        if ($songLengthFormatted === false) {
            echo "Invalid time format. Please enter as HH:MM:SS (include leading zeros).";
        } else {
            $sql = "UPDATE SONGS AS S
                    SET Song_length = ?
                    WHERE Song_id = ?";

            $stmt = $conn->prepare($sql);
            $stmt->bind_param("si", $songLength, $song_id);
            $stmt->execute();

            echo "Successfully set song length to " . $songLength . "\n\n";
        }
    }

    // Next we'll make INSERTS into other tables that relate to the
    // SONGS table via an fk

    // Add the album the song appears on
    if (!empty($aa_id) && !empty($songAlbum)) {
        // Make sure the album exists in the database first
        $sql = "SELECT Album_id
                FROM ALBUMS
                WHERE Album_name COLLATE utf8_unicode_ci = ?";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $songAlbum);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $artistAlbum_id = $row["Album_id"];
            } 
        } else {
        echo "Provided album " . $songAlbum . " not found, please add to Album table first!\n\n";
        }

        $sql = "INSERT INTO SONG_ALBUMS(Song_id, Album_id)
                VALUES(?, ?)";

        

        echo "Successfully marked song as appearing on " . $songAlbum . "\n\n";

        // If a track number was also provided then UPDATE that as well
        if(!empty($trackNum)) {
            $trackNum = (int)$trackNum; // Same dirty trick to make sure the user input a track number
            if ($trackNum < 1) {
                echo "Track number must be a positive integer";
            } else {
                $sql = "UPDATE SONG_ALBUMS
                        SET Track_number = ?
                        WHERE Song_id = ? AND Album_id = ?";

               $stmt = $conn->prepare($sql);
               $stmt->bind_param("iii", $trackNum, $song_id, $Album_id);
               $stmt->execute(); 

               echo "Set track number as " . $trackNum . "\n\n";
            }
        }
    }

   



}



// Close the connection to the datebase
$conn->close();

?>