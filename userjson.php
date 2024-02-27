<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$jsonFile = '/opt/user.json';
$jsonData = file_get_contents($jsonFile);
$data = json_decode($jsonData, true);
if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
    die("Error decoding JSON: " . json_last_error_msg());
}

$servername = 'localhost';
$username = 'root';
$password = '';
$dbname = 'kvm';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($data['kvmname'])) {
    $table1 = $data['kvmname'];
    foreach ($table1 as $record) {
        $id = $record['id'];
        $updateColumns = [];

        foreach ($record as $key => $value) {
            if ($key !== 'id') {
                $updateColumns[] = "$key='$value'";
            }
        }

        $setClause = implode(', ', $updateColumns);
        $sql = "UPDATE kvmname SET $setClause WHERE id=$id";

        if ($conn->query($sql) === TRUE) {
            echo "Record with ID $id updated successfully in table1<br>";
        } else {
            echo "Error updating record with ID $id in table1: " . $conn->error . "<br>";
        }
    }
} else {
    echo "The 'kvmname' key is missing in the JSON data.<br>";
}
if (isset($data['username'])) {
    $table2 = $data['username'];
    foreach ($table2 as $record) {
        $id = $record['id'];
        $updateColumns = [];

        foreach ($record as $key => $value) {
            if ($key !== 'id') {
                $updateColumns[] = "$key='$value'";
            }
        }

        $setClause = implode(', ', $updateColumns);
        $sql = "UPDATE username SET $setClause WHERE id=$id";

        if ($conn->query($sql) === TRUE) {
            echo "Record with ID $id updated successfully in table2<br>";
        } else {
            echo "Error updating record with ID $id in table2: " . $conn->error . "<br>";
        }
    }
} else {
    echo "The 'username' key is missing in the JSON data.<br>";
}

$conn->close();
?>