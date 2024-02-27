<?php 
include_once 'cachestart.php';

require 'portnameheader.php'; 
    $sql=$kvmdata->port();    $i = 0;
     
while ($row = mysqli_fetch_array($sql)) {     
    ?>
<form action method=post name="form<?php echo $i; ?>" id="form<?php echo $i; ?>">
    <tr style="text-align: center;">
        <td style="line-height:2" ;><input type="hidden" name="id" value="<?php echo $row['id']; ?>">
        <?php echo $row['id']; ?></td>
        <td><?php 
        for ($u=1 ; $u<=1; $u++) {
            echo "<input type=text name=user$u value='$row[portname]' placeholder='Enter Port Name' Required style='height: 30px;width: -webkit-fill-available;
            background-color: lightblue;'>";
        }
        ?></td>
        <td><input type=submit value=<?php echo $lang['B11']; ?> name=submit style=width:auto;padding:1px;height:40px></td>
    </tr>
</form>
    <?php     
}
?>
</table>
<br>
<?php 
  require_once 'portnamefooter.php';
  include_once 'cacheend.php';

?>
</body>

</html>