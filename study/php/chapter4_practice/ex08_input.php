<?php require "../header.php"; ?>

<p>店舗を選択してください</p>
<form action="ex08_output.php" method="post">
    <select name="code">
        <?php
            #連想配列
            $store=[
                '新宿'=>100,'秋葉原'=>101,'上野'=>102,'横浜'=>200,'川崎'=>201,
                '札幌'=>300,'仙台'=>400,'名古屋'=>500,'京都'=>600,'博多'=>700
            ];
            foreach($store as $text=>$value){
                echo "<option value='",$value,"'>",$text,"</option>";
            }
        ?>
    </select>
    <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>