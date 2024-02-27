<?php
// Step 1: Read Data from JSON File
$jsonFile = 'path/to/your/file.json';
$jsonData = file_get_contents($jsonFile);
$data = json_decode($jsonData, true);

// Step 2: Connect to Database
$servername = 'your_server_name';
$username = 'your_username';
$password = 'your_password';
$dbname = 'your_database_name';

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Step 3: Update Data in Database for Table1
$table1 = $data['table1'];
foreach ($table1 as $record) {
    $id = $record['id'];
    $name = $record['name'];
    $value = $record['value'];

    // Assuming your table1 has columns id, name, value
    $sql = "UPDATE table1 SET name='$name', value='$value' WHERE id=$id";
    
    if ($conn->query($sql) === TRUE) {
        echo "Record with ID $id updated successfully in table1<br>";
    } else {
        echo "Error updating record with ID $id in table1: " . $conn->error . "<br>";
    }
}

// Step 4: Update Data in Database for Table2
$table2 = $data['table2'];
foreach ($table2 as $record) {
    $id = $record['id'];
    $title = $record['title'];
    $content = $record['content'];

    // Assuming your table2 has columns id, title, content
    $sql = "UPDATE table2 SET title='$title', content='$content' WHERE id=$id";
    
    if ($conn->query($sql) === TRUE) {
        echo "Record with ID $id updated successfully in table2<br>";
    } else {
        echo "Error updating record with ID $id in table2: " . $conn->error . "<br>";
    }
}

// Step 5: Close Database Connection
$conn->close();
?>
