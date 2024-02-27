<?php  
session_start(); 
require_once 'en.php';
//include 'caps.html';
//include 'key.html';
?>

<link rel="stylesheet" href="css/usercss/bootstrap-grid.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap-reboot.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap-grid.css.map" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap-grid.min.css.map" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap-reboot.css.map" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap-reboot.min.css.map" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap.css.map" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/usercss/bootstrap.min.css.map" type="text/css" rel="stylesheet">


<style>
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
}
.header {
    background-color: floralwhite;
    font-size: medium;
}
.nav-tabs .nav-item.show .nav-link,
.nav-tabs .nav-link.active {
    color: #495057;
    background-color: #fff;
    border-color: black;
    border-block-width: 1px;
    margin-left: 5px;
}


.nav-tabs .nav-link {
    border: 2px solid darkgreen;
    border-top-left-radius: 0.25rem;
    border-top-right-radius: 0.25rem;
    height: 45px;
    text-align: center;
    margin-left: 2px;
    width: 170px;
    font-size: medium;
}

.nav-link {
    display: block;
    padding: 0.5rem 1rem;
    background-color: gainsboro;
}
.nav-tabs .active a {
    color: black;
    background: white;
    
}

</style>

    <header class="header" style="background-color: floralwhite;font-size: medium;">
    <?php require_once 'DBConnection.php'; $fetchdata=new DB_con(); $sql=$fetchdata->kvmdata(); $row=mysqli_fetch_array($sql); 
//echo $caps=$row['hotkey'];
//exit;
//$capsLockActive = isset($_SESSION['capsLockActive']) ? $_SESSION['capsLockActive'] : false;
if ($row['hotkey'] == '< Caps Lock>') {
    include 'caps.html';
} elseif($row['hotkey'] == '< Ctrl>'){
    include 'key.html';
}
else{
    echo 'scroll';
}

?>
    <div class="container-fluid"
        style="margin-top: 10px;margin-left: 5px;border:2px solid black;padding: 2px;height: 1060px;width: 1900px;">
        <span style="background-color:whitesmoke;">&nbsp;<?php echo $lang['H1']; ?></span>
        <div class="container-fluid"
            style="word-spacing: 3px;width: -2px;padding-left: 43px;color: revert;font-size: 27px;font-family: monospace;margin-top: -19px;">
            <h2><span style="background-color: lightgreen;font-size: 30px;font-family: times new roman;">
                    <?php echo $row['time']; ?></span>
                <label style="margin-left: 300px;">
                    <h1> <span style="background-color: lightpink;font-size: 55px; width: 200px;"> <?php echo $row['kvmname']; ?></span>
                    </h1>
                </label>
                <label
                    style="margin-left: 150px;font-size: 25px;word-spacing: -14px;width: auto;"><?php echo $lang['H8']; ?>:</label><input
                    type="text" value="<?php echo $_SESSION['username']; ?> "
                    style="background-color: lightgreen;width: 220px;text-align: center;">
                <a href="Actions_audit.php?a=logout" class="btn btn-primary" value="<?php echo $lang['B11']; ?>" name="save"
                    style="width: auto;margin-left: 160px;background-color:skyblue;height:4%;"> <?php echo $lang['H10']; ?></a>
                <h4><label style="margin-left: 1220px;word-spacing: -8px;"><?php echo $lang['H9']; ?> :<?php echo $row['hotkey']; ?>
                    </label></h4>
            </h2>
        </div>
        <ul class="nav nav-tabs" style="width: 1700px; height: 902px; overflow: hidden; margin-left: 25px;">
    <li class="nav-item <?php echo ($_SERVER['PHP_SELF'] == '/od/user.php') ? 'active' : ''; ?>">
        <a class="nav-link" href="user.php"><?php echo $lang['H2']; ?></a>
    </li>
    <li class="nav-item <?php echo ($_SERVER['PHP_SELF'] == '/od/portname.php' || $_SERVER['PHP_SELF'] == '/od/macadd.php' || $_SERVER['PHP_SELF'] == '/od/audio.php' || $_SERVER['PHP_SELF'] == '/od/resolution.php' ||$_SERVER['PHP_SELF'] == '/od/framerate.php' || $_SERVER['PHP_SELF'] == '/od/linktype.php' || $_SERVER['PHP_SELF'] == '/od/virtualmedia.php' || $_SERVER['PHP_SELF'] == '/od/portenable.php' || $_SERVER['PHP_SELF'] == '/od/scan.php' || $_SERVER['PHP_SELF'] == '/od/portauthority.php') ? 'active' : ''; ?>">
        <a class="nav-link" href="portname.php"><?php echo $lang['H3']; ?></a>
    </li>
    <li class="nav-item <?php echo ($_SERVER['PHP_SELF'] == '/od/username.php' || $_SERVER['PHP_SELF'] == '/od/userenable.php' || $_SERVER['PHP_SELF'] == '/od/useraut.php' || $_SERVER['PHP_SELF'] == '/od/userpass.php' || $_SERVER['PHP_SELF'] == '/od/function.php' ) ? 'active' : ''; ?>">
        <a class="nav-link" style="width: 207px;" href="username.php"><?php echo $lang['H4']; ?></a>
    </li>
    <li class="nav-item <?php echo ($_SERVER['PHP_SELF'] == '/od/kvmname.php' ||$_SERVER['PHP_SELF'] == '/od/time.php' || $_SERVER['PHP_SELF'] == '/od/lang.php' || $_SERVER['PHP_SELF'] == '/od/hotkey.php' || $_SERVER['PHP_SELF'] == '/od/thumbnailview.php' || $_SERVER['PHP_SELF'] == '/hotkey.php' || $_SERVER['PHP_SELF'] == '/od/thumbnailview.php' || $_SERVER['PHP_SELF'] == '/od/banner.php' || $_SERVER['PHP_SELF'] == '/od/encryption.php' ) ? 'active' : ''; ?>">
        <a class="nav-link" href="kvmname.php"><?php echo $lang['H5']; ?></a>
    </li>
    <li class="nav-item <?php echo ($_SERVER['PHP_SELF'] == '/od/kvmupgrade.php' || $_SERVER['PHP_SELF'] == '/od/dongleupgrade.php' || $_SERVER['PHP_SELF'] == '/od/reboot.php' || $_SERVER['PHP_SELF'] == '/od/upgradehistory.php' || $_SERVER['PHP_SELF'] == '/od/auditlog.php' ) ? 'active' : ''; ?>">
        <a class="nav-link" href="kvmupgrade.php"><?php echo $lang['H6']; ?></a>
    </li>
    <li class="nav-item <?php echo ($_SERVER['PHP_SELF'] == '/od/help.php') ? 'active' : ''; ?>">
        <a class="nav-link" href="help.php"><?php echo $lang['H7']; ?></a>
    </li>
</ul>
        <div
            style="border:1px solid black;padding: 2px;height: 853px;margin-top: -847px;width: 1870px;margin-left: 22px;">
        </div>
    </div>
</header>