<?php require "../header.php"; ?>

<?php
    $postcord = $_REQUEST['postcord'];
    #ハイフンありの郵便番号を判定する場合のpreg_match
    if(preg_match("/^[0-9]{3}-[0-9]{4}$/",$postcord)){
        echo "郵便番号",$postcord,"を確認しました";
    }else{
        echo $postcord,"は適切な郵便番号ではありません";
    }
?>

<?php require "../footer.php"; ?>