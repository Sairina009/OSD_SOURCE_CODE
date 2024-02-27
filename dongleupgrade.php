<?php require_once 'dongleheader.php';
$sql=$kvmdata->dongle();
while ($row=mysqli_fetch_array($sql)) { ?>
<form action method=post name="form<?php echo $i; ?>" id="form<?php echo $i; ?>">
    <tr align=center>
        <td height=40px><input type="hidden" name="id" value="<?php echo $row['id']; ?>"> <?php echo $row['id']; ?>
        <td align=left style=padding:10px><?php echo $row['portname'];?></td>
        <td align=center>
        <?php 
            for ($u=1 ; $u<=1; $u++) {
                ?>
        <input type=text name=user<?php echo $u; ?> value=<?php echo $row['version']; ?>>
            <?php
            }
            ?>
        </td>
       <td><input type=submit value=<?php echo $lang['U7'] ?><?php echo $row['id']; ?> name=submit<?php echo $row['id']; ?>
                style=width:auto;padding:1px;height:40px></td>
    </tr>
<?php } ?>
</form>
</form>
</table>
<br>
<?php 
  require_once 'donglefooter.php';
?>
</body>
</html>