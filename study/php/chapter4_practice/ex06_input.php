<?php require "../header.php"; ?>

<p>購入数を指定してください</p>
<form action="ex06_output.php"　method="post">
    <select name="count">
        <?php
            $i = 0;
            while ( $i <10 ){
                echo "<option value='",$i,"'>",$i,"</option>";  #※シングルクォーテーションとダブルクォーテーションの使い分けをしないと、どちらが文字列なのかが分からなくなる。
                $i++;
            }
        ?>
    </select>
    <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>