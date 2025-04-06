<?php require "../header.php"; ?>

<?php
    #isset関数でチェックボックス未選択時のエラーを改善する
    if(isset($_REQUEST['genre'])){
        foreach($_REQUEST['genre'] as $text){
            echo "<p>",$text,"</p>";
        }
        echo "<p>に関するお買い得情報をお送りさせていただきます。<br>ご協力ありがとうございました。</p>";
    }else{
        echo "ご協力ありがとうございました。";
    }
?>

<?php require "../footer.php"; ?>