<?php

// Connect to MySQL (replace these variables with your actual database credentials)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "oct";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Assuming you have a hidden input field for the thumbnail ID
    $id = isset($_POST["id"]) ? $_POST["id"] : null;
    $newThumbnailName = isset($_POST["thumbnail_name"]) ? $_POST["thumbnail_name"] : null;

    // Check if the file field is set and not empty
    if (isset($_FILES["thumbnail"]) && !empty($_FILES["thumbnail"]["tmp_name"])) {
        $newThumbnailData = file_get_contents($_FILES["thumbnail"]["tmp_name"]);
        $escapedNewThumbnailData = $conn->real_escape_string($newThumbnailData);

        // Update the thumbnail in the database
        $sql = "UPDATE portname SET image_data = '$escapedNewThumbnailData', image_name = '$newThumbnailName' WHERE id = $id";

        if ($conn->query($sql) === TRUE) {
            echo "Thumbnail updated successfully";
        } else {
            echo "Error updating thumbnail: " . $conn->error;
        }
    } else {
        echo "Error: Please select a new thumbnail";
    }
} else {
    echo "Error: Invalid request method";
}

// Close the connection
$conn->close();
?>