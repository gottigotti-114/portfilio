<?php require "../header.php"; ?>

<?php
    #時刻表示
    date_default_timezone_set('japan');
    echo "<p>",date('y/m/d H:i:s'),"</p>";
    echo "<p?>",date('y年m月d日 H時i分s秒'),"</p>";
    #date関数のフォーマット
    #y = ○○年　Y = ○○○○年　m = ○○月　d = ○○日　H = ○○時(24時間表示) h = ○○時(12時間表示) i = ○○分 s = ○○秒
?>

<?php require "../footer.php"; ?>