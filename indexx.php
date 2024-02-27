<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();
$error = "";

// Define the database configuration constants
if (!defined('host')) { define('host', "localhost"); }
if (!defined('username')) { define('username', "root"); }
if (!defined('password')) { define('password', ""); }
if (!defined('db_tbl')) { define('db_tbl', "oct"); }

// Function to retrieve the decoder count from the database
function getDecoderCountFromDB()
{
    $db = new DB_con();
    $sql = "SELECT decoder_count FROM decoder ORDER BY decoder_count DESC LIMIT 1";
    $result = $db->conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return (int)$row['count'];
    }

    return 0;
}

// Function to update the decoder count in the database
function updateDecoderCountInDB($count)
{
    $db = new DB_con();
    $sql = "UPDATE decoder SET decoder_count = $count ORDER BY id DESC LIMIT 1";
    if ($db->conn->query($sql) === false) {
        echo "Error: " . $sql . "<br>" . $db->conn->error;
        exit;
    }
    $db->conn->close();
}

// Retrieve the decoder count from the database
$decoderCount = getDecoderCountFromDB();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (!isset($_SESSION['username'])) {
        // Increment the count by 1
        $decoderCount++;
        updateDecoderCountInDB($decoderCount);
    }
}

if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if login is successful (replace with your authentication logic)
    if ($username === 'admin' && $password === 'Admin@123') {
        if ($decoderCount < 4) {
            // Store the IP address along with the decoder count in the database
            $ipAddress = $_SERVER['REMOTE_ADDR'];

            // Create a new database connection
            $db = new DB_con();

            // Insert the IP address and decoder count into the database
            $sql = "INSERT INTO decoder (ip_address, decoder_count) VALUES ('$ipAddress', $decoderCount)";
            if ($db->conn->query($sql) === false) {
                echo "Error: " . $sql . "<br>" . $db->conn->error;
                exit;
            }

            // Close the database connection
            $db->conn->close();

            // Increment the count by 1
            $decoderCount++;
            updateDecoderCountInDB($decoderCount);

            // Proceed with login
            $_SESSION['username'] = $username;
            header("Location: user.php");
            exit();
        } else {
            $error = "Maximum number of decoders connected.";
        }
    } else {
        $error = "Invalid Username or Password.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        .f1 {
            margin-top: 250px;
            margin-left: 700px;
            width: 400px;
            border: 2px solid #ccc;
            padding: 40px;
            background-color: lightblue;
            border-radius: 17px
        }

        h2 {
            text-align: center;
            margin-bottom: 40px;
            font-family: initial;
            color: aliceblue;
            align-content: left;
            height: 32px
        }
    </style>
</head>
<body>
    <form class="f1" action="" method="POST">
        <div style="text-align: center; font-size:16px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>
        <h2>Login with Username and Password</h2>
        <div class="form-group">
            <label for="username" class="text-info">Username:</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password" class="text-info">Password:</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
        </div>
    </form>
</body>
</html>

<?php
// DB_con class for database connection
Class DB_con
{
    public $conn;

    function __construct()
    {
        $this->conn = new mysqli(host, username, password, db_tbl);
        if ($this->conn->connect_error) {
            die("Database Connection Error: " . $this->conn->connect_error);
        }
    }
}
?>
