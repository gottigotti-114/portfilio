<?php require "../header.php"; ?>

<?php
    $postcord = $_REQUEST['postcord'];
    #　[0-9]を\d(￥d)として表すこともできる
    if(preg_match("/^\d{3}-\d{4}$/",$postcord)){
        echo "郵便番号",$postcord,"を確認しました";
    }else{
        echo "郵便番号",$postcord,"は適切なパスワードではありません";
    }
?>

<?php require "../footer.php"; ?>