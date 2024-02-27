<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thumbnail Viewer and Inserter</title>
</head>
<body>

<h2>Thumbnail Viewer</h2>

<!-- Display Thumbnails from Database -->
<?php
// PHP code to retrieve and display thumbnails

// Connect to MySQL (replace these variables with your actual database credentials)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "octkvm";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch thumbnails from the database
$sql = "SELECT id, image_name FROM portname";
$result = $conn->query($sql);

// Display thumbnails
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $thumbnailId = $row['id'];
        $thumbnailName = $row['image_name'];

        // Display thumbnail image with a link to view the full image
        echo "<div>";
        echo "<img src='view_thumbnail.php?id=$thumbnailId' alt='$thumbnailName' style='max-width: 100px;'>";
        echo "<p>$thumbnailName</p>";
        echo "</div>";
        
        // Move the hidden input inside the loop to capture the correct ID
        echo "<form action='thumb_update.php' method='post' enctype='multipart/form-data'>";
        echo "<input type='hidden' name='id' value='$thumbnailId'>";
        echo "<label for='thumbnail'>Select Thumbnail:</label>";
        echo "<input type='file' name='thumbnail' id='thumbnail' accept='image/*' required>";
        echo "<br>";
        echo "<label for='thumbnail_name'>Thumbnail Name:</label>";
        echo "<input type='text' name='thumbnail_name' id='thumbnail_name' required>";
        echo "<br>";
        echo "<input type='submit' value='Insert Thumbnail'>";
        echo "</form>";
    }
} else {
    echo "No thumbnails found";
}

// Close the connection
$conn->close();
?>

</body>
</html>
