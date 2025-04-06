<?php require "../header.php"; ?>
<?php
    #変数を一度代入したら二度と書き換えらせなくさせる魔法const
    const text = "こんにちは";
    text = "おはよう";
    echo text;
?>
<?php require "../footer.php"; ?>