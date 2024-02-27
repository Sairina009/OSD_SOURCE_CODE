<?php

// Read JSON file
$jsonFile = 'port.json';
$jsonData = file_get_contents($jsonFile);
$data = json_decode($jsonData, true);

// Connect to the MySQL database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kvm";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check the database connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Loop through users and update database
foreach ($data['users'] as $user) {
    $portid = $user['portid'];
    $audio = isset($user['audio']) ? $conn->real_escape_string($user['audio']) : null;

    // Replace 'your_table_name' with the actual name of your table
    $query = "UPDATE portname SET audio='$audio' WHERE id=$portid";

    // Output the query for debugging
    echo "Query: $query<br>";

    $result = $conn->query($query);

    if ($result === FALSE) {
        echo "Error updating record: " . $conn->error . "<br>";
    } else {
        if ($conn->affected_rows > 0) {
            echo "Record updated successfully for port ID: $portid<br>";
        } else {
            echo "No records were updated for port ID: $portid<br>";
        }
    }
}

// Close the database connection
$conn->close();

// Save updated data back to JSON file
file_put_contents($jsonFile, json_encode($data, JSON_PRETTY_PRINT));

echo 'Data updated and saved to the database and JSON file.';
?>
