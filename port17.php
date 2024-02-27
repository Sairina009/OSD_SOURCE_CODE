  <?php require_once 'DBConnection.php'; $fetchdata=new DB_con(); $sql=$fetchdata->kvmdata(); $row=mysqli_fetch_array($sql); 
if ($row['hotkey'] == '< Caps Lock>') {
    include 'caps.html';
} elseif($row['hotkey'] == '< Ctrl>'){
    include 'key.html';
}
else{
    echo 'scroll';
}

?>
<body>
    <div id="display">
        <?php
        require_once 'DBConnection.php';
        $kvmdata = new DB_con();
        $portNumber=17;

        $sql = $kvmdata->getPortData($portNumber);

while ($data = mysqli_fetch_array($sql)) {
    $thumbnailId = $data['id'];
    $thumbnailName = $data['image_name'];
    $screenName = $data['portname'];
    $screenType = $data['type'];
    $connectionStatus = $data['pc_online'];
?>
<div class="image-container">
   <img src='view_thumbnail.php?id=<?php echo $thumbnailId; ?>&timestamp=<?php echo time(); ?>' alt='<?php echo $thumbnailName; ?>' style="width: 1800; height: 730; margin-bottom: 20px;" class="button connect-button" data-id="<?php echo $thumbnailId; ?>" onclick="startStream(<?php echo $thumbnailId; ?>); closeCanvas()">

    <div class="image-info" style="margin-top: -501px;margin-left: 759px;">
        <p>Encoder Name:<?php echo $screenName; ?></p>
        <p>Connection Type: <?php echo $screenType; ?></p>
        <p>Status: <?php echo $connectionStatus; ?></p>
    </div>
</div>
<?php
}
?>

    </div>
    <script type="text/javascript" src="/public/jsmpeg.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <div class="page-content container">
        <div id="remoteVideos" oncontextmenu="return false;" style="display: none;">
            <canvas class="camera" id="videoCanvas"></canvas>
            <div id="canvasButtonContainer">
                <button class="button" id="closeButton" onclick="closeCanvas()">Close</button>
            </div>
        </div>
    </div>
    <style>
        #canvasButtonContainer {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }
    </style>
  
    <script type="text/javascript">
        var canvasVisible = false;
        var ws;
        var player;
        var appJsSocket;

        var fullScreenMode = false; 

        function stopAppJsStream() {
            if (appJsSocket && appJsSocket.readyState === WebSocket.OPEN) {
                appJsSocket.send("stop-stream");
            }
        }

        document.addEventListener("click", function(event) {
            if (event.target.classList.contains("connect-button")) {
                var buttonId = event.target.getAttribute("data-id");
                var newPageUrl = "in.html?id=" + buttonId;
                window.open(newPageUrl, "_blank");
            }
        });

        function closeCanvas() {
            document.getElementById("remoteVideos").style.display = "none";
            canvasVisible = false;

            if (player) {
                player.stop();
            }
            if (ws && ws.readyState === WebSocket.OPEN) {
                ws.close();
            }
        }
    </script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    function startStream(thumbnailId) {
        $.ajax({
            type: "GET",
            url: "view_thumbnail.php?id=" + thumbnailId + "&timestamp=" + new Date().getTime(),
            success: function(data) {
              
                $("#image-container").html('<img src="data:image/png;base64,' + data + '" />');
            },
            error: function(xhr, status, error) {
                console.error("Ajax request failed:", status, error);
            }
        });
    }
</script>
</body>
</html>