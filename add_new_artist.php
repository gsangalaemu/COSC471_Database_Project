<?php
include 'db_connection.php';

// The artist the user input
$artist = $_POST['artistName'];
$yearStart = $_POST['yearsStart'];
$yearEnd = $_POST['yearsEnd'];
$group = $_POST['groupAffils'];

$sql = "INSERT INTO ARTISTS(Artist_name)
        VALUES(?)";

// Prepare and bind the the variable
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $artist);
$stmt->execute();

// Track the auto-incremented pk of the new artist
// We'll use this for the other INSERT opererations
$artist_id = $conn->insert_id;

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
    // Check that the group affiliation exists in the artist table
    $sql = "SELECT Artist_id
            FROM Artists
            WHERE Artist_name = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $group);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {
            $group_id = $row["Artist_id"];
        }

        $sql = "INSERT INTO AFFILIATIONS(Artist_id, Group_id)
            VALUES(?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ii", $artist_id, $group_id);
        $stmt->execute();
    }  
}

if (!empty($artist_id)) {
    echo $artist . " successfully added to the artist database!";
}

// Close the connection to the datebase
$conn->close();

?>