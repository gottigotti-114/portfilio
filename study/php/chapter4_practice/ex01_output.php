<?php require "../header.php"; ?>

<?php
    #条件分岐
    if(isset($_REQUEST['mail'])){
        echo "お買い得メールをお送りさせていただきます";
    }else{
        echo "お買い得メールをお送りさせていただきません";
    }
?>

<?php require "../footer.php"; ?>