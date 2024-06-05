<?php
$json = $_POST['json'];
$file_path = $_POST['file_path'];

// Update default.json file
if (file_put_contents($file_path, $json) !== false) {
    echo "Success: JSON data written to $file_path";
} else {
    echo "Error: Failed to write JSON data to $file_path";
}
// Add this line for debugging
var_dump($_POST);
?>
