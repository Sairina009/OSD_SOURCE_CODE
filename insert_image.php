<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "octkvm";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM portname";
$result = $conn->query($sql);

while ($data = mysqli_fetch_array($result)) {
    $thumbnailId = $data['id'];
    $imagePath = '/home/acclivis/Desktop/images/port' . $thumbnailId . '.jpg';

    // Debug: Output the file path for each iteration
  //  echo "File Path: $imagePath<br>";

   $newThumbnailData = file_get_contents($imagePath);

        if ($newThumbnailData !== false) {
            // Escape binary data
            $escapedNewThumbnailData = mysqli_real_escape_string($conn, $newThumbnailData);

            // Update the thumbnail in the database
            $updateSql = "UPDATE portname SET image_data = '$escapedNewThumbnailData' WHERE id = $thumbnailId";

            if ($conn->query($updateSql) === TRUE) {
                echo "Thumbnail for ID $thumbnailId updated successfully<br>";
            } else {
                echo "Error updating thumbnail for ID $thumbnailId: " . $conn->error . "<br>";
            }
        } else {
            echo "Error: Unable to read file content for ID $thumbnailId<br>";
        }
    } else {
        echo "Error: File not found for ID $thumbnailId<br>";
    }
?>