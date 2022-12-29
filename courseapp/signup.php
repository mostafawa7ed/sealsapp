<?php
include "connect.php";
include "function.php";

// $username=htmlspecialchars(strip_tags($_POST['username']));
// $email=htmlspecialchars(strip_tags($_POST['email']));
// $password=htmlspecialchars(strip_tags($_POST['password']));

//resve 3 requerst
$username=filterRequest('username');
$email=filterRequest('email');
$password=filterRequest('password');
//seurity 
// htmlspecialchars(strip_tags($_POST['namerequrst']));
$stat = $con->prepare(
    "INSERT INTO `user`(`username`, `email`, `password`) VALUES (?,?,?)"
);
$stat->execute(array($username, $email, $password));
$count = $stat->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
?>