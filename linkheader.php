<?php require_once "header.php"; require_once 'portnav.php'; ?>
<?php
require_once 'DBConnection.php'; 
$updatedata=new DB_con(); 
if (isset($_POST['submit'])) { 
    $id =$_POST['id'];
    for ($u=1 ; $u<=1; $u++) {
        if (isset($_POST['user' .$u])) {
            $value =$_POST['user' .$u];
        } else {
            $value= '';
        }
        $sql=$updatedata->linkedit($value, $id);   
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
        <table id=table cellpadding=2 cellspacing=0 border="3" style="line-height: 3;margin-left: 45px;width: 50%;">
            <tr align=center style=background-color:lightsteelblue>
                <th class=lbl style=width:38px><?php echo $lang['A6']; ?></th>
                <th class=lbl style=width:360px><?php echo $lang['G2']; ?></th>
                <th class=lbl style=width:300px><?php echo $lang['I4']; ?></th>
                <th class=lbl style=width:50px><?php echo $lang['B11']; ?></th>
            </tr>
            <?php require_once 'DBConnection.php'; 
            $kvmdata=new DB_con();