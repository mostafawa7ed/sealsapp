<?php

$dns = "mysql:host=localhost;dbname=noteapp";
$user="root";
$pass="";


try{
$con = new PDO($dns,$user.$pass); 
$con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
$con->exec("set names utf8mb4");//make ir arbic

}
catch(PDOException $e)
{
echo $e->getMessage();
}
?>