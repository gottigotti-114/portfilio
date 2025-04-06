<?php require "../header.php"; ?>

<p>商品の色を選択してください</p>
<form action="ex07_output.php" method="post">
    <select name="color">
        <?php
            #配列とforeach文(配列の中身をひとつずつ出していくやつ)
            $color=["ホワイト","ブルー","レッド","イエロー","ブラック"];
            foreach($color as $text){
                echo "<option value='",$text,"'>",$text,"</option>";
            }
        ?>
    </select>
    <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>