<?php require "../header.php"; ?>

<?php
    #半角のカタカナから全角のカタカナに変換する関数mb_convert_kana
    echo "フリガナは「",mb_convert_kana($_REQUEST['name']),"」です";
?>

<?php require "../footer.php"; ?>