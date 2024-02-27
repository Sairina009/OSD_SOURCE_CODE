<?php
// process_connection.php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Your existing code to handle form data
    // ...

    // Redirect to index.html
    header("Location: in_user.html");
    exit();
}
?>

