<?php require "../header.php"; ?>

<?php
    $postcord = $_REQUEST['postcord'];
    #パターンマッチングで指定した正規表現がされているか確認する関数preg_match
    #preg_match("/  先頭を表す^  [最大値と最小値を指定]  {その数字が何個連なっている必要があるか}  末尾を表す$  /")
    if(preg_match("/^[0-9]{7}$/",$postcord)){
        echo "郵便番号",$postcord,"を確認しました";
    }else{
        echo $postcord,"は適切や郵便番号ではありません";
    }
?>

<?php require "../footer.php"; ?>