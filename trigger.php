<?php
function logChanges($data) {
    $filePath = 'C:/xampp1/htdocs/change_log.txt';

    $logMessage = 'ID: ' . $data['id'] . "\n";
    $logMessage .= 'Table Name: ' . $data['table_name'] . "\n";
    $logMessage .= 'Column Name: ' . $data['column_name'] . "\n";
    $logMessage .= 'Old Value: ' . $data['old_value'] . "\n";
    $logMessage .= 'New Value: ' . $data['new_value'] . "\n";
    $logMessage .= '------------------------' . "\n";
    file_put_contents($filePath, $logMessage);
}
$host = 'localhost';
$username = 'root';
$password = '';
$dbName = 'data';
$connection = mysqli_connect($host, $username, $password, $dbName);

if (!$connection) {
    die('Database connection failed: ' . mysqli_connect_error());
}
$query = "SELECT * FROM updated_columns_log WHERE updated_at = (SELECT MAX(updated_at) FROM updated_columns_log)";


$result = mysqli_query($connection, $query);

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data = array(
            'id' => $row['id'],
            'table_name' => $row['table_name'],
            'column_name' => $row['column_name'],
            'old_value' => $row['old_value'],
            'new_value' => $row['new_value']
        );
        logChanges($data);
    }
} else {
    echo 'Query failed: ' . mysqli_error($connection);
}

mysqli_close($connection);
?>