<?php  require_once 'header.php'; require_once 'mainnav.php'; ?>
<?php 
require_once 'DBConnection.php'; 
$updatedata=new DB_con(); 
if (isset($_POST['id'])) { 
    $submit =" ";
    for ($u=1 ; $u<=8; $u++) {
        if (isset($_POST['submit' . $u])) {
            $submit = $_POST['submit' . $u]; 
        }
    }
    if ($submit != '') {
        $id = str_replace('Upgrade', '', $submit);
    }
    $username = $_SESSION['username']; 
    $type= "Dongle FW Upgrade";
    $target_dir = "C:/xampp1/htdocs/";
    $path = $target_dir . basename($_FILES["file"]["name"]);
    for ($u=1 ; $u<=1; $u++) {
        if (isset($_POST['user' . $u])) {
            $value =$_POST['user' . $u];
        } else {
            $value= '';
        }
        $sql=$updatedata->dongleupgrade($type ,$username, $value ,$path);
        $sql=$updatedata->dongupgrade($path , $id);
    }
}
?>
<!DOCTYPE html>
<html lang=en>

<head>
    <meta charset=UTF-8>
    <meta http-equiv=X-UA-Compatible content="IE=edge">
    <meta name=viewport content="width=device-width, initial-scale=1.0">
    <title><?php echo $lang['PAGETITLE']; ?></title>
</head>

<body>
    <div style="border:1px solid black;padding:2px;height:750px;margin-top:-1px;width:1820px;margin-left:70px">
        <br>
        <form action method=post enctype=multipart/form-data name="form">
            <label style=margin-left:35px> Path:<label
                    style=background-color:lightblue;width:650px;></label>
                <input type=file name=file id=file style=width:108px;height:45px>
            </label>
            <br>
            <table id=table cellpadding=2 cellspacing=0 border=3 style=line-height:2;margin-left:45px;>
                <tr align=center style=background-color:lightsteelblue>
                    <th class=lbl style=width:65px><?php echo $lang['A6']; ?></th>
                    <th class=lbl style=width:350px><?php echo $lang['G2']; ?></th>
                    <th class=lbl style=width:160px><?php echo $lang['G6']; ?></th>
                    <th class=lbl style=width:118px><?php echo $lang['U7']; ?></th>
                </tr>
                <?php require_once 'DBConnection.php'; 
                $kvmdata=new DB_con(); 