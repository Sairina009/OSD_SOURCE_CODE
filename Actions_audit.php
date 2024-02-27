<?php 
session_start();
require_once 'DBConnection.php';
Class Actions extends DB_con
{
    function __construct()
    {
        parent::__construct();
    }
    function __destruct()
    {
        parent::__destruct();
    }
    function save_log($data=array())
    {
        if (count($data) > 0) {
            extract($data);
            $log['user_id'] = $_SESSION['id'];
        $log['action_made'] = "Logged in.";
        $log['event']="Access Login";
            $sql = "INSERT INTO `logs` (`user_id`,`action_made`,`event`) VALUES ('{$user_id}','{$action_made}','{$event}')";
            $save = $this->conn->query($sql);
            if (!$save) {
                die($sql." <br> ERROR:".$this->conn->error);
            }
        }
        return true;
    }
    function login()
    {
        extract($_POST);
        $username=$_POST['username'];
        $password=$_POST['password'];
        $sql = "SELECT id , username , password FROM username where username = '{$username}' and `password` = '".($password)."' ";
        @$qry = $this->conn->query($sql)->fetch_array();
        if (!$qry) {
            $resp['status'] = "failed";
            $resp['msg'] = "Invalid username or password.";
        } else {
            $resp['status'] = "success";
            $resp['msg'] = "Login successfully.";
        }
        return json_encode($resp);
    }
    function logout()
    {
        $log['user_id'] = $_SESSION['id'];
        $log['action_made'] = "Logged out.";
        $log['event']="Access Logout";
        $ipAddress = $_SERVER['REMOTE_ADDR'];

       
        session_destroy();
        // audit log
        $this->save_log($log);
        header("location:index.php");
    }
}
$a = isset($_GET['a']) ?$_GET['a'] : '';
$action = new Actions();
switch($a){
case 'login':
    echo $action->login();
    break;
case 'logout':
    echo $action->logout();
    break;
case 'save_log':
    $log['user_id'] = $_SESSION['id'];
    $log['action_made'] = $_POST['action_made'];
    $log['event'] = $_POST['event'];
    echo $action->save_log($log);
    break;
default:
    echo "No Action given";
    break;
}
?>