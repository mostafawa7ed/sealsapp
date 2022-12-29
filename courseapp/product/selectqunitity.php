<?php
include "../connect.php";
include "../function.php";
//resve 2 requerst
$userid=filterRequest('userid');  //send user id from app
//seurity 
$stat = $con->prepare(
    "SELECT i.id,quantity,date_edit_insert,p.name,p.code FROM product_item p,item_count i WHERE p.code=i.code and i.user_id=?"
);
$stat->execute(array($userid));
$count = $stat->rowCount();
$data = $stat->fetchAll(PDO::FETCH_ASSOC);
if ($count > 0) {
    echo json_encode(array("status" => "success","data"=>$data));
} else {
    echo json_encode(array("status" => "fail"));
}
?>