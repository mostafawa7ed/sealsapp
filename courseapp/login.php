<?php
include "connect.php";
include "function.php";
//resve 2 requerst
$email=filterRequest('email');
$password=filterRequest('password');
//seurity 
$stat = $con->prepare(
    "SELECT * FROM `user` WHERE `password`=? and `email`=? "
);
$stat->execute(array($password,$email));
$count = $stat->rowCount();
$data = $stat->fetch(PDO::FETCH_ASSOC);
if ($count > 0) {
    echo json_encode(array("status" => "success","data"=>$data));
} else {
    echo json_encode(array("status" => "fail"));
}
?>