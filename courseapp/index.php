<?php
include"connect.php";
$stat = $con->prepare("DELETE FROM `user` WHERE `id`=5 ");
$stat->execute();
$count1 = $stat->rowCount();
if ($count1 > 0) {
    echo "success delete";
} else {
    echo "faild delete";
}
?>