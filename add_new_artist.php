<?php
include 'db_connection.php';

// The artist the user input
$artist = $_POST['artistName'];
$yearStart = $_POST['yearsStart'];
$yearEnd = $_POST['yearsEnd'];
$group = $_POST['groupAffils'];

// Insert the new artist into the ARTISTS table
$sql = "INSERT INTO ARTISTS(Artist_name)
        VALUES(?)";

// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $artist);
$stmt->execute();

// Track the auto-incremented pk of the new artist
// We'll use this for the other INSERT opererations
$artist_id = $conn->insert_id;

if (!empty($artist_id)) {
    echo $artist . " successfully added to the artist database!\n\n";
}

// Check if the user provided start and end years, add
// them if so. Because an artist may have multiple start
// and ends dates and each is optional, we check what
// the user provided

// yearStart provided, but not yearEnd
if (!empty($yearStart) && empty($yearEnd)) {
    $sql = "INSERT INTO YEARS_ACTIVE(Artist_id, Start_date)
            VALUES(?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $artist_id, $yearStart);
    $stmt->execute();
}

// yearEnd provided, but not yearStart
if (!empty($yearEnd) && empty($yearStart)) {
    $sql = "INSERT INTO YEARS_ACTIVE(Artist_id, End_date)
            VALUES(?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $artist_id, $yearEnd);
    $stmt->execute();
}

// yearStart and yearEnd provided
if (!empty($yearStart) && !empty($yearEnd)) {
    $sql = "INSERT INTO YEARS_ACTIVE(Artist_id, Start_date, End_date)
            VALUES(?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iss", $artist_id, $yearStart, $yearEnd);
    $stmt->execute();
}

// Check if a group affiliation was provided, insert if so
if (!empty($group)) {
    
    // Seperate multiple group affiliations into an array
    $groupArray = explode(",", $group); 

    foreach ($groupArray as $groupItem) {
        $groupItem = trim($groupItem); // Trim leading and trailing white space

        // Check that the group affiliation exists in the artist table
        $sql = "SELECT Artist_id
                FROM ARTISTS
                WHERE Artist_name = ?";
        
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $groupItem);
        $stmt->execute();

        $result = $stmt->get_result();

        // Add the affiliation if the artist exist, else print an error asking the user to add it first
        if ($result->num_rows > 0) {

            while ($row = $result->fetch_assoc()) {
                $group_id = $row["Artist_id"];
            }

            $sql = "INSERT INTO AFFILIATIONS(Artist_id, Group_id)
                VALUES(?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $artist_id, $group_id);
            $stmt->execute();

            echo "Added affiliation " . $groupItem . "\n\n";

        } else {
            echo "Provided affiliation " . $groupItem . " not found, please add to Artist table first!\n\n";
        }
    }    
}

// Close the connection to the datebase
$conn->close();

?>