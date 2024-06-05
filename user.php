<?php 
include_once 'cachestart.php';
require_once 'uheader.php';

// Fetch banner information from the database
$banner_query = mysqli_query($kvmdata->conn, "SELECT * FROM kvmname where id=1");
$banner_info = mysqli_fetch_assoc($banner_query);
$banner = $banner_info['banner'];
$bannertime = $banner_info['bannertime'];

$bannertimeInSeconds = $bannertime; 

$sql = $kvmdata->user();
$i = 0; 
while ($result = mysqli_fetch_array($sql)) {
    $portname = $result['portname'];
    $ip_address = $result['ip_address'];
    $connect = $result['connect']; 
    $decode_id = $result['decoder_count']; 
    $path = $result['path']; 
    $active_local = $result['active_local']; 
    $portLimit = 3; 
    $enableValue = $result['enable' . $_SESSION['id']];
    $maxConnectionsMessage = '';
    $viewOnlyMessage = '';
    $disabled = ($connect >= $portLimit || $active_local == 0 || empty($enableValue)) ? 'disabled' : ''; 
    
    if ($banner == "ON") {
        if ($connect >= $portLimit) {
            $maxConnectionsMessage = 'Channel Occupy';
        }
        
        if (($connect == 1 || $connect == 2) && $_SESSION['id'] != 1) {
            $viewOnlyMessage = 'You can only view the encoder';
        }
    }

    $port_id = isset($result['id']) ? $result['id'] : null;

$decoder = mysqli_query($kvmdata->conn, "SELECT ip_address FROM decoder where decoder_count='$decode_id'");
$decode = mysqli_fetch_assoc($decoder);

$de = $decode['ip_address'];

    if ($port_id !== null) {
    
        $result1 = mysqli_query($kvmdata->conn, "SELECT * FROM portname WHERE id='$port_id'");
        $row = mysqli_fetch_assoc($result1);
        $user_id = (int)$_SESSION['id'];
        $authority = isset($row["a$user_id"]) ? $row["a$user_id"] : ''; 
    } else {
        
        $authority = ''; 
    }

    $user_id = (int)$_SESSION['id'];
    $decoder_count_query = mysqli_query($kvmdata->conn, "SELECT decoder_count FROM decoder WHERE user_id = '$user_id'");
    if ($decoder_count_query) {
        $decoder_count_row = mysqli_fetch_assoc($decoder_count_query);
        $decoder_id = isset($decoder_count_row['decoder_count']) ? $decoder_count_row['decoder_count'] : ''; // Handle decoder_id
    } else {
  
        $decoder_id = ''; 
    }

    ?>
    <form action="" method="post" name="form<?php echo $i; ?>" id="form<?php echo $i; ?>">
        <tr align=center>
            <td style="padding:10px">
                <input type="hidden" name="id" value="<?php echo $result['id']; ?>">
                <?php echo $result['id']; ?>
            </td>
           <td>
    <?php echo ($result['scan' . $_SESSION['id']] == '1') ? 's' : ''; ?>
</td>

            <td>
                <?php echo $portname; ?>
                <?php if ($banner == "ON"): ?>
                    <?php if (!empty($maxConnectionsMessage)): ?>
                        <br>
                        <span id="maxConnections_<?php echo $i; ?>" style="color: red;"><?php echo $maxConnectionsMessage; ?></span>
                        <script>
                            setTimeout(function() {
                                document.getElementById("maxConnections_<?php echo $i; ?>").innerHTML = "";
                            }, <?php echo $bannertimeInSeconds * 1000; ?>);
                        </script>
                    <?php elseif (!empty($viewOnlyMessage)): ?>
                        <br>
                        <span id="viewOnly_<?php echo $i; ?>" style="color: blue;"><?php echo $viewOnlyMessage; ?></span>
                        <script>
                            setTimeout(function() {
                                document.getElementById("viewOnly_<?php echo $i; ?>").innerHTML = "";
                            }, <?php echo $bannertimeInSeconds * 1000; ?>);
                        </script>
                    <?php endif; ?>
                <?php endif; ?>
            </td>
            <td><?php echo $result['type']; ?></td>
            <td><?php echo $result['pc_online']; ?></td> 
            <td>
                <input type="button" class="button" name="save" value="Connect" onclick="connectToIndex(<?php echo $result['id']; ?>, '<?php echo $authority; ?>', '<?php echo $i; ?>')" <?php echo $disabled; ?>>
            </td>
        </tr>
        <input type="hidden" name="portname" value="<?php echo $portname; ?>">
      
        <input type="hidden" id="ip_address_<?php echo $i; ?>" name="ip_address" value="<?php echo $ip_address; ?>">

        <input type="hidden" id="path_<?php echo $i; ?>" name="path" value="<?php echo $path; ?>"> 

        <input type="hidden" id="decoder_id_<?php echo $i; ?>" name="decoder_id" value="<?php echo $decoder_id; ?>">
       
     <input type="hidden" id="decoder_ip_<?php echo $i; ?>" name="decoder_ip" value="<?php echo $de; ?>">

    </form>
    <?php 
    $i++; 
} 
?>

</table>
<br>
<script type="text/javascript">
function connectToIndex(id, authority, index) {
    console.log("Button clicked with id: " + id + ", authority: " + authority); 

    var ip_address = document.getElementById('ip_address_' + index).value;
    console.log("IP Address:", ip_address);

    var decoder_id = document.getElementById('decoder_id_' + index).value;
    console.log("Decoder ID:", decoder_id);

   var decoder_ip = document.getElementById('decoder_ip_' + index).value;
console.log("Decoder IP:", decoder_ip);

    var path = document.getElementById('path_' + index).value;
    console.log("Path:", path);

    updateDatabase(id, decoder_id, ip_address, path, decoder_ip);
}

// Function to update data in the database
function updateDatabase(id, decoder_id, ip_address, path, decoder_ip) {
    var data = new FormData();
    data.append('id', id); // 
    data.append('decoder_id', decoder_id);
    data.append('ip_address', ip_address);
    data.append('decoder_ip', decoder_ip);
    data.append('path', path); 
    data.append('save', 'true'); 

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'uheader.php', true); 
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = xhr.responseText;
            console.log("Response from uheader.php:", response);
            // Database updated, now update JSON
            updateDefaultJson(ip_address, '/home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json', id, decoder_id, path, decoder_ip);
        }
    };
    xhr.send(data);
}

function updateDefaultJson(ip_address, file_path, id, decoder_id, path, decoder_ip) {
    var xhr_json = new XMLHttpRequest();
    xhr_json.open('GET', file_path, true);
    xhr_json.onreadystatechange = function () {
        if (xhr_json.readyState === 4) {
            if (xhr_json.status === 200) {
                console.log("Response from server:", xhr_json.responseText);
                try {
                    var default_json = JSON.parse(xhr_json.responseText);
                    default_json.server.uri = "rtsp://" + ip_address + ":9099/stream";
                    default_json.server.socket_port_mouse = 1792;
                    default_json.server.socket_port_keyboard = 1791;
                    default_json.server.socket_port_mass = 1793;
                    default_json.server.virtual_media = path; // Added path
                    default_json.server.encoderIP = ip_address;
                    default_json.server.decoderIP = decoder_ip; // Current 
                    default_json.server.remoteMassPath = "./downloads/";
                    default_json.server.userName = "<?php echo $_SESSION['username']; ?>";

                 
                    var updated_json = JSON.stringify(default_json, null, 2);

          
                    var xhr_update_json = new XMLHttpRequest();
                    xhr_update_json.open('POST', 'update_default_json.php', true);
                    xhr_update_json.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr_update_json.onreadystatechange = function () {
                        if (xhr_update_json.readyState === 4 && xhr_update_json.status === 200) {
                            console.log("default.json updated successfully.");
                            
                            checkAuthority(id, decoder_id, decoder_ip);
                        }
                    };
                    xhr_update_json.send('json=' + encodeURIComponent(updated_json) + '&file_path=' + encodeURIComponent(file_path));
                } catch (error) {
                    console.error("Error parsing JSON:", error);
                }
            } else {
                console.error("Error fetching default.json. Status:", xhr_json.status);
            }
        }
    };
    xhr_json.send();
}

function checkAuthority(id, decoder_id, decoder_ip) {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'check_authority.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            console.log("Response:", response);

            var userAuthority = response.authority;
            var viewOnly = response.view_only;
           // var ip_address = response.ip_address;
            var decoder_ip = response.decoder_ip;
            

            console.log("Authority: " + userAuthority + ", View Only: " + viewOnly + ", Decoder IP: " + decoder_ip);
            

            if ((userAuthority === "Share" && viewOnly === "0")) {
                // If user has Share authority and view_only is 0, or View authority and view_only is 0, proceed to index.html
                console.log("User has full access. Redirecting to index.html.");
                window.location.href = "index.html?id=" + id + "&decoder_id=" + decoder_id + "&decoder_ip=" + decoder_ip;
            }

            else if (userAuthority === "View" && viewOnly === "0") {
                console.log("NO access. Redirecting to index.html.");
                window.location.href = "index.html?id=" + id + "&decoder_id=" + decoder_id + "&decoder_ip=" + decoder_ip;
            }

             else if (viewOnly === "1" || viewOnly === "2" ) {
              window.location.href = "index.html?id=" + id + "&decoder_id=" + decoder_id + "&decoder_ip=" + decoder_ip;
            } else {
                console.log("Access blocked.");
            }
        }
    };
    xhr.send('id=' + id + '&decoder_id=' + decoder_id);
}

</script>

<?php 
require_once 'userfooter.php';
include_once 'cacheend.php';
?>
</body>
</html>
