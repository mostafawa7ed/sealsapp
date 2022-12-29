<?php
include "connect.php";
include "function.php";
//resve 2 requerst
$note_id=filterRequest('noteid');  //send note id from app
//seurity 
$stat = $con->prepare(
    "DELETE FROM `notes` WHERE `note_id`=?"
);
$stat->execute(array($note_id));
$count = $stat->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
?>