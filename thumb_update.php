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
    $directory = '/home/acclivis/Desktop/images/';
    $pattern = 'port' . $thumbnailId . '.*';
    $files = glob($directory . $pattern);

    if ($files) {
        foreach ($files as $file) {
            // Construct the path to the image file
            $imagePath = '/home/acclivis/Desktop/images/' . basename($file);

            // Update the database with the image path
            $updateSql = "UPDATE portname SET image_name = '$imagePath' WHERE id = 1";

            if ($conn->query($updateSql) === TRUE) {
                echo "Thumbnail for ID $thumbnailId updated successfully<br>";
            } else {
                echo "Error updating thumbnail for ID $thumbnailId: " . $conn->error . "<br>";
            }
        }
    } else {
        echo "Error: No files found for ID $thumbnailId\n";
    }
}

$conn->close();
?>
