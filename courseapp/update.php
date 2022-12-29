<?php
include "connect.php";
include "function.php";
$note_title=filterRequest('note_title');
$note_content=filterRequest('note_content');
$user_id=filterRequest('note_user');
$stat = $con->prepare(
    "UPDATE `notes` SET `note_title`=?,`note_content`=? WHERE `note_user`=?"
);
$stat->execute(array($note_title, $note_content, $user_id));
$count = $stat->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
?>