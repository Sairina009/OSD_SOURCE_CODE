<?php
  require_once 'demoheader.php'; 
if (isset($_POST['id'])) {
    $imageId = $_POST['id'];
    $sql = $updatedata->connect($imageId, $value);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $lang['PAGETITLE']; ?></title>
    <style type="text/css">
        #videoOG {
            position: fixed;
            z-index: -1;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('img').click(function() {
            var imageId = $(this).data('id');
            $.post('update-image.php', { id: imageId });
        });
    });
</script>

</head>

<body>
    <div id="display" style="margin-left: 89px;margin-top: -790px;">
        <div id="display-image">
            <?php
            require_once 'DBConnection.php';
            $kvmdata = new DB_con();
            $sql = $kvmdata->image();
            while ($data = mysqli_fetch_array($sql)) {
                ?>
                <img src="./image/<?php echo $data['filename']; ?>" style="width: 400px;height:300px;" data-id="<?php echo $data['id']; ?>">
            <?php
            }
            ?>
        </div>
    </div>
    <br>
    
    <?php 
    require_once 'udemofooter.php';
    ?>
</body>

</html>