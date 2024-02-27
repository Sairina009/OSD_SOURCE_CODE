<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


if (!defined('host')) { define('host', "localhost"); }
if (!defined('username')) { define('username', "kvm"); }
if (!defined('password')) { define('password', "kvm2023"); }
if (!defined('db_tbl')) { define('db_tbl', "kvm"); }
Class DB_con
{
   
    public $conn;
    public $error;
    function __construct()
    {
        $this->conn = new mysqli(host, username, password, db_tbl);
        if (!$this->conn) {
            die("Database Connection Error. ".$this->conn->error);
        }
    }
    function __destruct()
    {
         $this->conn->close();
    }
    public function logindata($username , $password)  
    {
        
        $result=mysqli_query($this->conn, "SELECT * from username WHERE username ='$username' and password='$password'");
        $result3=mysqli_query($this->conn, "SELECT * FROM `portname`");
        $result1=mysqli_fetch_object($result);
        $result2=mysqli_fetch_object($result3);
        $count = mysqli_num_rows($result);

        if($count > 0 ) { 
        if ($username && $password && $result1->active=='1'&&$result1->authority=='Admin'&&$result1->view=='OFF'&& $result1->id) {
            $id = $result1->id;
           
            $result4=mysqli_query($this->conn, "INSERT INTO `logs` (`user_id`,`action_made`,`event`) VALUES ('$id','Logged in','Access Login')");
            $_SESSION['id']=$result1->id;$_SESSION['username']=$result1->username;
            $_SESSION['p1']=$result2->scan1;$_SESSION['scan2']=$result2->scan2;$_SESSION['scan3']=$result2->scan3;$_SESSION['scan4']=$result2->scan4;
             $_SESSION['scan5']=$result2->scan5;$_SESSION['scan6']=$result2->scan6;$_SESSION['scan7']=$result2->scan7;$_SESSION['scan8']=$result2->scan8;
             $_SESSION['scan9']=$result2->scan9;$_SESSION['scan10']=$result2->scan10;$_SESSION['scan11']=$result2->scan11;$_SESSION['scan12']=$result2->scan12;
             $_SESSION['scan13']=$result2->scan13;$_SESSION['scan14']=$result2->scan14;$_SESSION['scan15']=$result2->scan15;$_SESSION['scan16']=$result2->scan16;
             $_SESSION['enable1']=$result2->enable1;$_SESSION['enable2']=$result2->enable2;$_SESSION['enable3']=$result2->enable3;
             $_SESSION['enable4']=$result2->enable4;$_SESSION['enable5']=$result2->enable5;$_SESSION['enable6']=$result2->enable6;
             $_SESSION['enable7']=$result2->enable7;$_SESSION['enable8']=$result2->enable8;$_SESSION['enable9']=$result2->enable9;
             $_SESSION['enable10']=$result2->enable10;$_SESSION['enable11']=$result2->enable11;$_SESSION['enable12']=$result2->enable12;
             $_SESSION['enable13']=$result2->enable13;$_SESSION['enable14']=$result2->enable14;$_SESSION['enable15']=$result2->enable15;
             $_SESSION['enable16']=$result2->enable16;
             
             $_SESSION['a1']=$result2->a1;$_SESSION['a2']=$result2->a2;$_SESSION['a3']=$result2->a3;$_SESSION['a4']=$result2->a4;$_SESSION['a5']=$result2->a5;$_SESSION['a6']=$result2->a6;$_SESSION['a7']=$result2->a7;$_SESSION['a8']=$result2->a8;$_SESSION['a9']=$result2->a9;$_SESSION['a10']=$result2->a10;$_SESSION['a11']=$result2->a11;$_SESSION['a12']=$result2->a12;$_SESSION['a13']=$result2->a13;$_SESSION['a14']=$result2->a14;$_SESSION['a15']=$result2->a15;$_SESSION['a16']=$result2->a16;header("location:user.php");
                   
             }
                 else if ($username && $password && $result1->active=='1'&&$result1->authority=='Admin'&&$result1->view=='ON'&& $result1->id) {
                     $id = $result2->id;
                     $result4=mysqli_query($this->conn, "INSERT INTO `logs` (`user_id`,`action_made`,`event`) VALUES ('$id','Logged in','Access Login')");
           $_SESSION['id']=$result1->id;$_SESSION['username']=$result1->username;
                     $_SESSION['scan1']=$result2->scan1;$_SESSION['scan2']=$result2->scan2;$_SESSION['scan3']=$result2->scan3;
                          $_SESSION['scan4']=$result2->scan4;$_SESSION['scan5']=$result2->scan5;$_SESSION['scan6']=$result2->scan6;
                          $_SESSION['scan7']=$result2->scan7;$_SESSION['scan8']=$result2->scan8;$_SESSION['scan9']=$result2->scan9;
                          $_SESSION['scan10']=$result2->scan10;$_SESSION['scan11']=$result2->scan11;$_SESSION['scan12']=$result2->scan12;
                          $_SESSION['scan13']=$result2->scan13;$_SESSION['scan14']=$result2->scan14;$_SESSION['scan15']=$result2->scan15;
                          $_SESSION['scan16']=$result2->scan16;
                          $_SESSION['enable1']=$result2->enable1;$_SESSION['enable2']=$result2->enable2;$_SESSION['enable3']=$result2->enable3;
                          $_SESSION['enable4']=$result2->enable4;$_SESSION['enable5']=$result2->enable5;$_SESSION['enable6']=$result2->enable6;
                          $_SESSION['enable7']=$result2->enable7;$_SESSION['enable8']=$result2->enable8;$_SESSION['enable9']=$result2->enable9;
                          $_SESSION['enable10']=$result2->enable10;$_SESSION['enable11']=$result2->enable11;$_SESSION['enable12']=$result2->enable12;
                          $_SESSION['enable13']=$result2->enable13;$_SESSION['enable14']=$result2->enable14;$_SESSION['enable15']=$result2->enable15;
                          $_SESSION['enable16']=$result2->enable16;
      $_SESSION['a1']=$result2->a1;$_SESSION['a2']=$result2->a2;$_SESSION['a3']=$result2->a3;$_SESSION['a4']=$result2->a4;$_SESSION['a5']=$result2->a5;$_SESSION['a6']=$result2->a6;$_SESSION['a7']=$result2->a7;$_SESSION['a8']=$result2->a8;$_SESSION['a9']=$result2->a9;$_SESSION['a10']=$result2->a10;$_SESSION['a11']=$result2->a11;$_SESSION['a12']=$result2->a12;$_SESSION['a13']=$result2->a13;$_SESSION['a14']=$result2->a14;$_SESSION['a15']=$result2->a15;$_SESSION['a16']=$result2->a16;header("location:demo.php");
                 }
                 else if ($username && $password &&  $result1->active=='1'&&$result1->authority=='User'&&$result1->view=='OFF'&& $result1->id) {
                     $id = $result2->id;
                     $result5=mysqli_query($this->conn, "INSERT INTO `logs` (`user_id`,`action_made`,`event`) VALUES ('$id','Logged in','Access Login')");
                     $_SESSION['id']=$result1->id;$_SESSION['username']=$result1->username;
                     $_SESSION['scan1']=$result2->scan1;$_SESSION['scan2']=$result2->scan2;$_SESSION['scan3']=$result2->scan3;
                          $_SESSION['scan4']=$result2->scan4;$_SESSION['scan5']=$result2->scan5;$_SESSION['scan6']=$result2->scan6;
                          $_SESSION['scan7']=$result2->scan7;$_SESSION['scan8']=$result2->scan8;$_SESSION['scan9']=$result2->scan9;
                          $_SESSION['scan10']=$result2->scan10;$_SESSION['scan11']=$result2->scan11;$_SESSION['scan12']=$result2->scan12;
                          $_SESSION['scan13']=$result2->scan13;$_SESSION['scan14']=$result2->scan14;$_SESSION['scan15']=$result2->scan15;
                          $_SESSION['scan16']=$result2->scan16;
                          $_SESSION['enable1']=$result2->enable1;$_SESSION['enable2']=$result2->enable2;$_SESSION['enable3']=$result2->enable3;
                          $_SESSION['enable4']=$result2->enable4;$_SESSION['enable5']=$result2->enable5;$_SESSION['enable6']=$result2->enable6;
                          $_SESSION['enable7']=$result2->enable7;$_SESSION['enable8']=$result2->enable8;$_SESSION['enable9']=$result2->enable9;
                          $_SESSION['enable10']=$result2->enable10;$_SESSION['enable11']=$result2->enable11;$_SESSION['enable12']=$result2->enable12;
                          $_SESSION['enable13']=$result2->enable13;$_SESSION['enable14']=$result2->enable14;$_SESSION['enable15']=$result2->enable15;
                          $_SESSION['enable16']=$result2->enable16;
                          $_SESSION['a1']=$result2->a1;$_SESSION['a2']=$result2->a2;$_SESSION['a3']=$result2->a3;$_SESSION['a4']=$result2->a4;$_SESSION['a5']=$result2->a5;$_SESSION['a6']=$result2->a6;$_SESSION['a7']=$result2->a7;$_SESSION['a8']=$result2->a8;$_SESSION['a9']=$result2->a9;$_SESSION['a10']=$result2->a10;$_SESSION['a11']=$result2->a11;$_SESSION['a12']=$result2->a12;$_SESSION['a13']=$result2->a13;$_SESSION['a14']=$result2->a14;$_SESSION['a15']=$result2->a15;$_SESSION['a16']=$result2->a16;header("location:onlyuser.php");
                                 }
                 else if ($username && $password && $result1->active=='1'&&$result1->authority=='User'&&$result1->view=='ON'&&  $result1->id) {
                    $id = $result2->id;
                    $result6=mysqli_query($this->conn, "INSERT INTO `logs` (`user_id`,`action_made`,`event`) VALUES ('$id','Logged in','Access Login')");
                   
                    $_SESSION['id']=$result1->id;$_SESSION['username']=$result1->username;
                    $_SESSION['scan1']=$result2->scan1;$_SESSION['scan2']=$result2->scan2;$_SESSION['scan3']=$result2->scan3;
                         $_SESSION['scan4']=$result2->scan4;$_SESSION['scan5']=$result2->scan5;$_SESSION['scan6']=$result2->scan6;
                         $_SESSION['scan7']=$result2->scan7;$_SESSION['scan8']=$result2->scan8;$_SESSION['scan9']=$result2->scan9;
                         $_SESSION['scan10']=$result2->scan10;$_SESSION['scan11']=$result2->scan11;$_SESSION['scan12']=$result2->scan12;
                         $_SESSION['scan13']=$result2->scan13;$_SESSION['scan14']=$result2->scan14;$_SESSION['scan15']=$result2->scan15;
                         $_SESSION['scan16']=$result2->scan16;
                         $_SESSION['enable1']=$result2->enable1;$_SESSION['enable2']=$result2->enable2;$_SESSION['enable3']=$result2->enable3;
                         $_SESSION['enable4']=$result2->enable4;$_SESSION['enable5']=$result2->enable5;$_SESSION['enable6']=$result2->enable6;
                         $_SESSION['enable7']=$result2->enable7;$_SESSION['enable8']=$result2->enable8;$_SESSION['enable9']=$result2->enable9;
                         $_SESSION['enable10']=$result2->enable10;$_SESSION['enable11']=$result2->enable11;$_SESSION['enable12']=$result2->enable12;
                         $_SESSION['enable13']=$result2->enable13;$_SESSION['enable14']=$result2->enable14;$_SESSION['enable15']=$result2->enable15;
                         $_SESSION['enable16']=$result2->enable16;
                         $_SESSION['a1']=$result2->a1;$_SESSION['a2']=$result2->a2;$_SESSION['a3']=$result2->a3;$_SESSION['a4']=$result2->a4;$_SESSION['a5']=$result2->a5;$_SESSION['a6']=$result2->a6;$_SESSION['a7']=$result2->a7;$_SESSION['a8']=$result2->a8;$_SESSION['a9']=$result2->a9;$_SESSION['a10']=$result2->a10;$_SESSION['a11']=$result2->a11;$_SESSION['a12']=$result2->a12;$_SESSION['a13']=$result2->a13;$_SESSION['a14']=$result2->a14;$_SESSION['a15']=$result2->a15;$_SESSION['a16']=$result2->a16;header("location:userdemo.php");
                                }
                      
            else if ($username && $password && $result1->active=='0' && $result1->authority=='Admin' && $result1->id) {
            
            header("location: index.php");
            $error=" Account Invalid ";
            }    
            else if ($username && $password && $result1->active=='0' && $result1->authority=='User' && $result1->id) {
            $error="Account Invalid";
            header("location: index.php");
               
             }   
              
             }
        else { 
             $error="Invalid Username and Password";
         } 
                
         return $error;
         return $result1; 
         return $result2;
         return $result4;
         return $result5;
         return $result3;
         return $result6;
        
    }
    public function audit()
    {
        $per_page_record = 15;        
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT l.*,u.username FROM `logs` l inner join username u on l.user_id = u.id LIMIT $start_from, $per_page_record"); 
        return $result1;
    }
    public function port()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT * FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function portcount()
    {
        $result1=mysqli_query($this->conn, "SELECT COUNT(*) FROM portname");
        return $result1;
    }
    public function logcount()
    {
        $result1=mysqli_query($this->conn, "SELECT COUNT(*) FROM logs");
        return $result1;
    }
    public function audio()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;      
        $result1=mysqli_query($this->conn, "SELECT audio, format, portname, id FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function resolution()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT resolution, portname, id, framerate FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function link()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;      
        $result1=mysqli_query($this->conn, "SELECT linktype, portname, id FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function dongle()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;      
        $result1=mysqli_query($this->conn, "SELECT id , portname, version, path FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function virtual()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT id , portname, media FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function portenable()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT * FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function user()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT * from portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function image()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT * from portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
      public function macadd()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;      
        $result1=mysqli_query($this->conn, "SELECT id , portname, macaddr FROM portname LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function upgradehistory()
    {
        $per_page_record = 15;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;     
        $result1=mysqli_query($this->conn, "SELECT type , user , starttime, endtime ,perversion, upgradeversion, result from upgradehistory LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function scan()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;      
        $result1=mysqli_query($this->conn, "SELECT * FROM portname  LIMIT $start_from, $per_page_record");
        return $result1;
    }
    public function userport()
    {
        $result =mysqli_query($this->conn, "SELECT * FROM `username` INNER JOIN `portname` ON username.id = portname.id where portname.id<=8");
        return $result;
    }
    public function portdata()
    {
        $result1=mysqli_query($this->conn, "SELECT id , type , portname , media, linktype,resolution,audio ,format,macaddr from portname where id<=8");
        return $result1;
        $this->conn->close();
    }
    public function thumbnailview()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;      
        $result1=mysqli_query($this->conn, "SELECT thumbnail FROM portname  LIMIT $start_from, $per_page_record");
        return $result1;
    }
public function getPortData($portNumber)
{
    $query = "SELECT * FROM portname WHERE id = $portNumber";
    $result = mysqli_query($this->conn, $query);

    if (!$result) {

        return false;
    }
return $result;
   $this->conn->close();
}

    public function portdata1()
    {
        $result1=mysqli_query($this->conn, "SELECT id , type , portname , media, resolution, linktype,audio ,format,macaddr from portname where id>=9 && id<=16");
        return $result1;
        $this->conn->close();
    }
    public function portdata2()
    {
        $result1=mysqli_query($this->conn, "SELECT id , type , portname, media, linktype, resolution,audio ,format,macaddr from portname where id>=17 && id<=24");
        return $result1;
        $this->conn->close();
    }
    public function portdata3()
    {
        $result1=mysqli_query($this->conn, "SELECT id , type , portname, media, linktype, resolution,audio ,format,macaddr from portname where id>=25 && id<=32");
        return $result1;
        $this->conn->close();
    }
    public function caps()
    {
        $query = mysqli_query($this->conn,"UPDATE `kvmname` SET `hotkey`='< Caps Lock>' WHERE id='1'");
         header("location:caps.html");
        return $query;
      
    }
    public function thumb($value, $id)
    {
        $query = mysqli_query($this->conn,"UPDATE `portname` SET `thumbnail`='$value' WHERE id='$id'");
        return $query;
      
    }
    public function control()
    {
        $query = mysqli_query($this->conn,"UPDATE `kvmname` SET `hotkey`='< Ctrl>' WHERE id='1'");
       
        return $query;
        
    }
    public function scroll()
    {
        $query = mysqli_query($this->conn,"UPDATE `kvmname` SET `hotkey`='< Scroll Lock>' WHERE id='1'");
        return $query;
    }
    public function english()
    {
        $query = mysqli_query($this->conn,"UPDATE `kvmname` SET `language`='English' WHERE id='1'");
        return $query;
    }
    public function french()
    {
        $query = mysqli_query($this->conn,"UPDATE `kvmname` SET `language`='French' WHERE id='1'");
        return $query;
    }
    public function german()
    {
        $query = mysqli_query($this->conn,"UPDATE `kvmname` SET `language`='German' WHERE id='1'");
        return $query;
    }
    public function portupdate($value , $value1,$id)
    {
        $query = mysqli_query($this->conn, "UPDATE `portname` SET `audio`='$value', format='$value1' , lastUpdatedBy=NOW() WHERE id='$id'"); 
        return $query;
        $this->conn->close();
    }
    public function virtualupdate($path , $id)
    {
        $query = mysqli_query($this->conn,"UPDATE `portname` SET `media`='$path', lastUpdatedBy=NOW() WHERE id='$id'");
        return $query;
    }
    public function portenableupdate($value, $id, $u)
    {
        $query = "UPDATE `portname` SET `enable$u`='$value' WHERE id='$id'";
        $result = mysqli_query($this->conn, $query);
        
        if (!$result) {
             echo "Update query failed: " . mysqli_error($this->conn);
            return false;
        }
        
        return $result;
    }
    
    public function scanupdate($value , $id , $u)
    {
        $query = mysqli_query($this->conn,"UPDATE `portname` SET `scan$u`='$value' WHERE id='$id'");
        return $query;
    }
    public function portautupdate($value , $id , $u)
    {
        $query = mysqli_query($this->conn,"UPDATE `portname` SET `a$u`='$value' WHERE id='$id'");
        return $query;
    }
    public function connect($port_id, $portname, $decoder_name, $user_id)
    {
      // $id = $user_id;
    $result = mysqli_query($this->conn, "SELECT * FROM portname WHERE id='$port_id'");
    
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $currentConnectValue = $row['connect'];
        $user_id = (int)$user_id;
        $key = 'a' . $user_id;
        $authority = $row[$key];
        $query = mysqli_query($this->conn, "UPDATE portname SET pc_online='Yes', connect = $currentConnectValue + 1, status='busy', decoder_name='$decoder_name', lastUpdatedBy=NOW() WHERE id='$port_id'");  
            $query1 = mysqli_query($this->conn, "UPDATE `decoder` SET `encoder_id`='$port_id' , `user_id`='$user_id',
             `user_authority`= '$authority' WHERE decoder_name='$decoder_name'");        
             if ($query && $query1) {
                if ($query1 != '') {
                    $query3 = mysqli_query($this->conn, "UPDATE portname SET pc_online='Yes', lastUpdatedBy=NOW() WHERE id='$port_id'");
                } else {
                    $query4 = mysqli_query($this->conn, "UPDATE portname SET pc_online='Idle', lastUpdatedBy=NOW() WHERE id='$port_id'");
                }
            }
        
    }
    return $query;
    return $query1;
    return $query3;
}
    public function requestPortAccess($user_id, $portname, $decoder_name, $port_id) {
        $query = false;
       $result = mysqli_query($this->conn, "SELECT * FROM portname WHERE id='$port_id'");

        if ($result) {
            $row = mysqli_fetch_assoc($result);
            $currentConnectValue = $row['connect'];
            $user_id = (int)$user_id;
            $key = 'a' . $user_id;
            $authority = $row[$key];
            $query = mysqli_query($this->conn, "UPDATE portname SET pc_online='Yes', connect = $currentConnectValue + 1, status='busy', decoder_name='$decoder_name', lastUpdatedBy=NOW() WHERE id='$port_id'");
            $query1 = mysqli_query($this->conn, "UPDATE `decoder` SET `encoder_id`='$port_id', `user_id`='$user_id', `user_authority`= '$authority' WHERE decoder_name='$decoder_name'");
            $result = mysqli_query($this->conn, "
                SELECT d.`decoder_count`, d.`encoder_id`, d.`user_id`, p.`id`, p.`a$user_id`, p.`connect`, p.`status`, p.`decoder_name` AS authority
                FROM `decoder` AS d
                JOIN `portname` AS p ON d.`encoder_id` = p.`id`
                WHERE p.`portname` = '$portname' AND d.`user_id` = '$user_id'
            ");

            $row = mysqli_fetch_assoc($result);

            if ($row !== null) {
       
                $currentConnectValue = isset($row['connect']) ? $row['connect'] : null;
                $portStatus = isset($row['status']) ? $row['status'] : null;
                $operatingDecoder = isset($row['authority']) ? $row['authority'] : null;
                $port_id = isset($row['encoder_id']) ? $row['encoder_id'] : null;

     
                if ($operatingDecoder == 'Share') {
                    if ($currentConnectValue > 3) {
                      
                        $this->addToPortQueue($user_id, $portname, $decoder_name, $portStatus);
                        return; 
                    } else {
                        $updatePortQuery = "UPDATE portname 
                                            SET pc_online='Yes', connect = $currentConnectValue + 1, status='busy', decoder_name='$decoder_name', lastUpdatedBy=NOW() 
                                            WHERE portname='$portname'";

                        $query = mysqli_query($this->conn, $updatePortQuery);

                        if ($query) {
                            $updateDecoderQuery = "UPDATE decoder SET encoder_id='$port_id' WHERE decoder_name='$decoder_name'";
                            $query = mysqli_query($this->conn, $updateDecoderQuery);

                            if ($query) {
                                $updateStatusQuery = "UPDATE portname SET pc_online='Yes', lastUpdatedBy=NOW() WHERE portname='$portname'";
                                $query = mysqli_query($this->conn, $updateStatusQuery);

                                $this->processQueue($portname);
                            }
                        }
                    }
                } else {
                    
                }

                if ($portStatus !== 'busy') {
                   
                } else {
                    $this->addToPortQueue($user_id, $portname, $decoder_name, $portStatus);
                }
            }

            return $query;
        }
    }

    public function addToPortQueue($user_id, $portname, $decoder_name, $portStatus) {
        $query = mysqli_query(
            $this->conn,
            "INSERT INTO port_queue (user_id, portname, decoder_name,request_time, status) VALUES 
                                    ('$user_id', '$portname', '$decoder_name', NOW(), 'waiting')"
        );

        return $query;
    }

    public function processQueue($portname) {
        $queueQuery = mysqli_query($this->conn, "SELECT * FROM port_queue WHERE portname='$portname' AND status='waiting' ORDER BY request_time ASC LIMIT 1");

        if ($queueQuery && mysqli_num_rows($queueQuery) > 0) {
            $queueRow = mysqli_fetch_assoc($queueQuery);
            $user_id = $queueRow['user_id'];
            $decoder_name = $queueRow['decoder_name'];
            mysqli_query($this->conn, "UPDATE port_queue SET status='processed' WHERE id='{$queueRow['id']}'");
            $this->requestPortAccess($user_id, $portname, $decoder_name, $queueRow['encoder_id']);
        }
    }

    public function start($startupTimestamp , $event , $details)
    {
    $query=mysqli_query($this->conn,"INSERT INTO logs (date_created, action_made, event) VALUES ('$startupTimestamp', '$event', '$details')");

    echo "Audit log entry added successfully.";
    return $query;
    }

    public function connectdata()
    {
        $query = mysqli_query($this->conn,"SELECT * from username where id=$_SESSION[id]");
        return $query;
    }
    public function userdata()
    {    
        $result1=mysqli_query($this->conn, "select * from username");
      
        return $result1;
        $this->conn->close();
    }
    public function userhiddata()
    {    
        $result1=mysqli_query($this->conn, "SELECT hid from username");
        return $result1;
        $this->conn->close();
    }
    public function usermassdata()
    {    
        $result1=mysqli_query($this->conn, "SELECT mass from username");
        return $result1;
        $this->conn->close();
    }
    public function time($time)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE kvmname SET time='$time' WHERE id =1");
        return $updaterecord;
        header("time.php");
    }
    public function encryption($value)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE kvmname SET encryption='$value' WHERE id =1");
        return $updaterecord;
    }
    public function view($value)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE username SET view='$value'");
        return $updaterecord;
    }
    public function hid($value ,$u)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE `username` SET `hid`='$value' WHERE id='$u'");
        return $updaterecord;
    }
    public function mass($value ,$m)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE `username` SET `mass`='$value' WHERE id='$m'");
        return $updaterecord;
    }
    public function card($value ,$c)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE `username` SET `card`='$value' WHERE id='$c'");
        return $updaterecord;
    }
    public function virtua($value ,$v)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE `username` SET `virtual`='$value' WHERE id='$v'");
        return $updaterecord;
    }
    public function dongleupgrade($type ,$username, $value ,$path)
    {
        $updaterecord=mysqli_query($this->conn,"INSERT INTO `upgradehistory`(`type`, `user`, `starttime`, `endtime`, `perversion`, `upgradeversion`, `result`, `path`) 
      VALUES ('$type',' $username ',NOW(),NOW(),'$value','','successful','$path')");
      return $updaterecord;
    } 
    public function dongupgrade($path , $id)
    {
        $updaterecord=mysqli_query($this->conn,"UPDATE `portname` SET `upgrade`=1, lastUpdatedBy=NOW(),`path`= '$path' WHERE id='$id'");
      return $updaterecord;
    } 
    public function help()
    {
        $updaterecord=mysqli_query($this->conn, "SELECT version from portname WHERE id=8");
        return $updaterecord;
    }
    public function auditlog()
    {
        $updaterecord=mysqli_query($this->conn, "SELECT id , action_made , date_created FROM `logs` where id<=15");
        return $updaterecord;
    }   
    public function banner($value, $time)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE kvmname SET banner='$value', bannertime='$time' WHERE id =1");
        return $updaterecord;
        header("banner.php");
    }
    public function enable($value , $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE username SET active='$value', lastUpdatedBy=NOW()  WHERE id ='$id'");
        return $updaterecord;
    }  
    public function authority($value , $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE username SET authority='$value', lastUpdatedBy=NOW()  WHERE id ='$id'");
        return $updaterecord;
    }     
    public function username($value, $userid)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE username SET username='$value' WHERE id =$userid");
        return $updaterecord; 
    }
    public function pass($id)
    {
        $updaterecord=mysqli_query($this->conn, "SELECT aespass, despass,3despass, password from username WHERE id=$id");
        return $updaterecord;
    }
    public function passupdate($pass, $value,$encrypted, $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE username set aespass='". $pass. "' , despass= DES_ENCRYPT('$value')  , 3despass='". $encrypted. "', password='". $value. "' WHERE id=$id");
        return $updaterecord;
    }

    public function kvmupdate($name)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE kvmname SET kvmname='$name' WHERE id =1");
        return $updaterecord;
        header("kvmname.php");
    }
    public function portname($value , $id) 
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE portname SET portname='$value' WHERE id='$id'");
        return $updaterecord;
    }
    public function resolutionedit($value , $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE portname SET resolution='$value' , lastUpdatedBy=NOW() WHERE id='$id'");
        return $updaterecord;
    }
     public function frame($value , $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE portname SET framerate='$value' , lastUpdatedBy=NOW() WHERE id='$id'");
        return $updaterecord;
    }
    public function mac($value , $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE portname SET macaddr='$value' , lastUpdatedBy=NOW() WHERE id='$id'");
        return $updaterecord;
    }
    public function linkedit($value , $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE portname SET linktype='$value' , lastUpdatedBy=NOW() WHERE id ='$id'");
        return $updaterecord;
    }
    public function audioedit($value , $value1, $id)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE portname SET audio='$value' , format='$value1' , lastUpdatedBy=NOW() WHERE id ='$id'");
        return $updaterecord;
    }
    public function kvmdata()
    {
        $result1=mysqli_query($this->conn, "SELECT * from kvmname ");
        return $result1;
        $this->conn->close();
    }
    public function fetchonerecord($userid)
    {
        $oneresult=mysqli_query($this->conn, "select id ,username , password  from username where id='$userid'");
        return $oneresult;
        $this->conn->close();
    }
    public function onlyuser()
    {
        $per_page_record = 8;          
        if (isset($_GET["page"])) {    
            $page  = $_GET["page"];    
        }    
        else {    
            $page=1;    
        }    
        $start_from = ($page-1) * $per_page_record;  
        $oneresult=mysqli_query($this->conn, "SELECT * from portname LIMIT $start_from, $per_page_record");
       return $oneresult;
     
    }
    public function hotkeyupdate($hotkey)
    {
        $updaterecord=mysqli_query($this->conn, "UPDATE kvmname SET hotkey='$hotkey' WHERE id =1");
        return $updaterecord;
        $this->conn->close();
    }
    public function upgradedata()
    {
        $result1=mysqli_query($this->conn, "SELECT type , user , starttime, endtime ,perversion, upgradeversion, result, path from upgradehistory where no<=15 ");
        return $result1;
        $this->conn->close();
    }  
    public function upgrade()
    {
        $result1=mysqli_query($this->conn, "SELECT path from upgradehistory");
        return $result1;
        $this->conn->close();
    }
    public function kvmupgrade($type , $username, $path)
    {
        $result1=mysqli_query(
            $this->conn, "INSERT INTO `upgradehistory`(`type`, `user`, `starttime`, `endtime`, `perversion`, `upgradeversion`, `result`, `path`) 
      VALUES ('$type','$username',NOW(),NOW(),'','','successful','$path')"
        );
        $updaterecord=mysqli_query($this->conn, "UPDATE kvmname SET path='$path' WHERE id =1");
        return $result1;
        return $updaterecord;
        header("kvmupgrade.php");
        $this->conn->close();
    }
}
?>