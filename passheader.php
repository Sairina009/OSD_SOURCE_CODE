<?php require 'header.php';  require 'kvmnav.php';?>
<?php
$updatedata=new DB_con();
if (isset($_POST['submit'])) { 
    $id =$_POST['id'];
    for ($u=1 ; $u<=1; $u++) {
        if (isset($_POST['user' . $u])) {
            $value =$_POST['user' . $u];
            $value1 =$_POST['user1' . $u];
            $sql=$updatedata->pass($id);
            $row = mysqli_fetch_array($sql);     
        function Str_Openssl_enc($str)
        {
            $key='1234567890vishal%$%^%$$#$#';
            $chiper="AES-128-CTR";
            $options=0;
            $iv='1234567890123456';
            $str=openssl_encrypt($str, $chiper, $key, $options, $iv);
            return $str;
        }
        function tripleDesEncrypt($data, $key) {
            $encrypted = openssl_encrypt($data, 'DES-EDE3', $key, OPENSSL_RAW_DATA);
            return base64_encode($encrypted);
        }
        $key1 = "09876543210%$$#$#";
        $encrypted = tripleDesEncrypt($value, $key1);
            $pass=Str_Openssl_enc($value);
        } else {
            $value= '';
        }
        if ($value == $value1) {
            $sql=$updatedata->passupdate($pass ,$value,$encrypted, $id);
         } else {
            $error = "Not Same";
        }
    } 
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $lang['PAGETITLE']; ?></title>
</head>

<body>
    <div style="border:1px solid black;padding: 2px;height: 790px;margin-top: -1px;width: 1820px;margin-left: 70px;">
        <br>
        <div class="error" style="color: red;">
            <?php if (isset($error)) {
                echo $error; 
            } 
            ?>
        </div>
        <table id="table" cellpadding="2" cellspacing="0" border="3" style="line-height: 2;margin-left: 45px;width:50%;">
            <tr align="center" style="background-color: lightsteelblue;">
                <th class="lbl" style="width:50px;"><?php echo $lang['A6']; ?></th>
                <th class="lbl"><?php echo $lang['H8']; ?></th>
                <th class="lbl"><?php echo $lang['F16']; ?></th>
                <th class="lbl"><?php echo $lang['F17']; ?></th>
                <th class="lbl"><?php echo $lang['F18']; ?></th>
                <th class="lbl"><?php echo $lang['B11']; ?></th>
            </tr>
            <?php  
            require_once "DBConnection.php";
            $kvmdata=new DB_con();
            $sql=$kvmdata->userdata();