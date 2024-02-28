<?php require_once 'oheader.php';
 $sql=$kvmdata->user();
$i = 0; 
while ($result=mysqli_fetch_array($sql)) {
 $portname = $result['portname'];
 $idd = $result['id'];
            $connect = $result['connect']; 
            $portLimit = 3; 
            $portAvailable = $connect < $portLimit;

            $reconnectDelay = 60;
            $reconnectTime = isset($_SESSION[$portname]) ? $_SESSION[$portname] : 0;
            $portReconnectAvailable = (time() - $reconnectTime) >= $reconnectDelay;
            $allowReconnect = $portAvailable || $portReconnectAvailable;
 ?>
<form action="" method="post" name="form<?php echo $i; ?>" id="form<?php echo $i; ?>">

    <tr align=center>
        <td style=padding:10px><input type="hidden" name="id" value="<?php echo $result['id']; ?>">
            <?php echo $result['id']; ?></td>
        <td><?php
        $idd = $result['id'];
        $host = "localhost"; 
        $user = "kvm"; 
        $password = "kvm2023"; 
        $dbname = "kvm"; 
        $conn = mysqli_connect($host, $user, $password,$dbname);
        $oneresult=mysqli_query($conn, "SELECT * from username RIGHT JOIN kvmname ON username.id=kvmname.id ");
        $re=mysqli_fetch_array($oneresult);
        $banner = $re['banner'];
        $time = $re['bannertime'];
        $id = $_SESSION['id'];
        echo $result['scan' . $id]; ?></label></td>
        <input type="hidden" name="banner" value="<?php echo $banner;?>">
        <input type="hidden" name="time" value="<?php echo $time;?>">
       
        <label id="msg" value=""></label>
      
<td align="left">

    &nbsp;<input type="hidden" name="portname" value="<?php echo $result['portname']; ?>">
    <?php
    
        echo $result['portname'];
        $connect = $result['connect']; 
        $portLimit = 3; 

        if ($connect >= $portLimit) {
            $errorMessage = 'Port is busy';
            $errorId = 'errorMsg' . $result['portname']; 
            echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="' . $errorId . '" style="color: red;">' . $errorMessage . '</span>&nbsp;';
            echo '<script>';
            echo 'setTimeout(function(){ document.getElementById("' . $errorId . '").innerHTML = ""; }, ' . ($time * 1000) . ');';
            echo '</script>';
        } 
    ?>
</td>

    <td><?php echo $result['type']; ?></td>

        <?php
        $idd = $result['id'];
        $host = "localhost"; 
        $user = "kvm"; 
        $password = "kvm2023"; 
        $dbname = "kvm"; 
        $conn = mysqli_connect($host, $user, $password,$dbname);
        $one=mysqli_query($conn, "SELECT * from decoder");
        $res=mysqli_fetch_array($one);
        $decoder_name = $res['decoder_name'];
         ?>
        <input type="hidden" name="decoder_name" value="<?php echo $decoder_name;?>">
        <td class="py-1 px-2"><?php echo $_SESSION['enable'.$id];  ?> </td>
      
        <?php
        $id = $_SESSION['id'];

        $connect = $result['connect']; 
        $portLimit = 3; 
        $enableValue = $result['enable' . $id];

        if ($connect >= $portLimit || $enableValue == '') {
          
        echo '<td class="py-1 px-2">  <input type="button" class="button" value="Connect" disabled></td>';
    } else {
        echo '<td class="py-1 px-2">  <input type="button" class="button connectButton" value="Connect"></td>';
    }
        
        ?>
    </tr>
    </form>
    <?php } ?>

    </table>
    <br>

    <script type="text/javascript">
       
var connectButtons = document.getElementsByClassName("connectButton");
for (var i = 0; i < connectButtons.length; i++) {
    connectButtons[i].addEventListener("click", function() {
        // Redirect to index.html
        window.location.href = "index.html";
    });
}   
     function decrementConnectNumber() {
    var xhr = new XMLHttpRequest();
    var url = 'decrement_connect_count.php';
    var params = 'portname=<?php echo $portname; ?>&id=<?php echo $id; ?>';

    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log('Request successful');
        } else {
            console.error('Request failed with status:', xhr.status);
        }
    };

    xhr.send(params);
}

</script>
<?php 
require_once 'onlyuserfooter.php';
?> 
</body>
</html>
