<?php require "../header.php"; ?>
<p><?php echo $_REQUEST['price'],"と",$_REQUEST['count'],"を掛けたら"; ?></p>
<p><?php echo $_REQUEST['price'] * $_REQUEST['count'],"となります"; ?></p>

<!-- 改めて変数で再定義 -->
<?php
    $value1 = $_REQUEST['price'];
    $value2 = $_REQUEST['count'];

    echo "先ほど入力した",$value1,"と",$value2,"を足し合わせた値は",$value1+$value2,"となります";
?>


<?php require "../footer.php"; ?>