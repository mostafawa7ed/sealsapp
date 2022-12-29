<?php
include "../connect.php";
include "../function.php";
$pro_name=filterRequest('pro_name');
$pro_code=filterRequest('pro_code');
$pro_price = filterRequest('pro_price');
$pro_sale_price = filterRequest('pro_sale_price');
$id_user = filterRequest('id_user');
            $stat0 = $con->prepare(
                "SELECT * FROM `product_item` WHERE `code`=?"
            );
            $stat0->execute(array($pro_code));
            $count0 = $stat0->rowCount();
if ($count0 == 0) {
                    $stat1 = $con->prepare(
                        "INSERT INTO `product_item`(`name`, `code`,`price`,`sale_price`,`user_id`) VALUES (?,?,?,?,?)"
                    );
                    $stat1->execute(array($pro_name, $pro_code, $pro_price, $pro_sale_price, $id_user));
                    $count1 = $stat1->rowCount();                             
                    $stat2 = $con->prepare(
                        "SELECT `item_id` FROM `product_item` WHERE `code`=?"
                    );
                    $stat2->execute(array($pro_code));
                    $data = $stat2->fetch(PDO::FETCH_ASSOC);
                    $pro_id = (int) $data['item_id'];
                    $user_id = (int) $id_user;
                    $stat3 = $con->prepare(
                        "INSERT INTO `item_count`(`id`,`quantity`, `date_edit_insert`,`user_id`,`code`) VALUES (?,0,?,?,?)"
                    );
                    $stat3->execute(array($pro_id, date("Y-m-d h:i:sa"), $user_id,$pro_code));
                    $count3 = $stat3->rowCount();
                    echo json_encode(array("status" => "success"));
                } else {
    echo json_encode(array("status" => "item_product_exist"));
}
?>