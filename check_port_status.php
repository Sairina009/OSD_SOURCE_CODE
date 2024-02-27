<?php
// Get the portname from the request
$portname = $_POST['portname'];

$host = "localhost";
$user = "root";
$password = "";
$dbname = "kvm";

$conn = mysqli_connect($host, $user, $password, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT status FROM portname WHERE portname = '$portname'";
$result = mysqli_query($conn, $sql);

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $status = $row['status'];

        if ($status === 'busy') {
            echo 'busy';
        } else {
            echo 'available';
        }
    } else {
        echo 'available';
    }
} else {
    echo 'error';
}

mysqli_close($conn);
?>