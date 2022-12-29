<?php
include "../connect.php";
include "../function.php";
//resve 2 requerst
$item_code=filterRequest('code');  //send user id from app
//seurity 
$stat = $con->prepare(
    "SELECT i.id,quantity,date_edit_insert,p.name,p.code FROM product_item p,item_count i where p.code = ? and p.item_id =i.id"
);
$stat->execute(array($item_code));
$count = $stat->rowCount();
$data = $stat->fetchAll(PDO::FETCH_ASSOC);
if ($count > 0) {
    echo json_encode(array("status" => "success","data"=>$data));
} else {
    echo json_encode(array("status" => "fail"));
}
?>