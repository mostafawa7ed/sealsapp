<?php
include "../connect.php";
include "../function.php";
//resve 2 requerst
$code=filterRequest('code');
$quantity=filterRequest('quantity');
$edit_date = date("y/m/d/h/i/s");
//seurity 
$stat = $con->prepare(
    "UPDATE `item_count` SET `quantity`=? ,`date_edit_insert`=?  WHERE code = ?"
);
$stat->execute(array($quantity,$edit_date,$code));
$count = $stat->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
?>