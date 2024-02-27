<?php require_once 'auditheader.php'; 
$sql=$kvmdata->audit();
while ($row=mysqli_fetch_array($sql)) {
    $username=$row['username']; ?>
<tr>
    <td class="py-1 px-2"><?php echo date("M d, Y H:i", strtotime($row['date_created'])) ?></td>
    <td class="py-1 px-2"><?php echo $row['event']; ?></td>
    <td class="py-1 px-2"><?php echo 'User&nbsp;'.$username , '&nbsp;'.$row['action_made'] ?></td>
</tr>
<?php } ?>
</tbody>
</table>
</div>
<?php require_once 'auditfooter.php'; ?>
</div>
</body>

</html>