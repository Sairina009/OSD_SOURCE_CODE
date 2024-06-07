<?php require_once 'header.php'; require_once 'kvmnav.php'; ?>
<?php
$updatedata=new DB_con();
if (isset($_POST['hid'])) { 
    for ($u=1 ; $u<=2; $u++) {
        if (isset($_POST['user' . $u])) {
            $value =$_POST['user' . $u];
        } else {
            $value= '';
        }
         $sql=$updatedata->hid($value, $u); 
    }
}

if (isset($_POST['mass'])) { 
    for ($m=1 ; $m<=2; $m++) {
        if (isset($_POST['mass' . $m])) {
            $value =$_POST['mass' . $m];
        } else {
            $value= '';
        }
        $sql=$updatedata->mass($value, $m); 
    }

} 

if (isset($_POST['card'])) { 
    for ($c=1 ; $c<=2; $c++) {
        if (isset($_POST['card' . $c])) {
            $value =$_POST['card' . $c];
        } else {
            $value= '';
        }
        $sql=$updatedata->card($value, $c); 
    }

}

if (isset($_POST['virtual'])) { 
    for ($v=1 ; $v<=2; $v++) {
        if (isset($_POST['virtual' . $v])) {
            $value =$_POST['virtual' . $v];
        } else {
            $value= '';
        }
        $sql=$updatedata->virtua($value, $v);  
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
    <div class=topnav>
        <div style="border:1px solid black;padding:2px;height:790px;margin-top:-1px;width:1820px;margin-left:70px">
            <br>
            <br>
            <table id=table cellpadding=2 cellspacing=0 border=3 style=margin-left:45px>
                <tr align=center style=background-color:lightsteelblue>
                    <th class=lbl style=width:55px><?php echo $lang['A19']; ?></th>
                    <th class=lbl style=width:400px><?php echo $lang['F5']; ?></th>
                     <th style=background-color:lightsteelblue;text-align:left>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </th>
                    <th class=lbl style=width:90px><?php echo $lang['B11']; ?></th>
                </tr>
                <?php
                require_once "DBConnection.php";
                $kvmdata=new DB_con();
                $sql=$kvmdata->userdata();
