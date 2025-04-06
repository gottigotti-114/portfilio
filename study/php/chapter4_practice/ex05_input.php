<?php require "../header.php"; ?>

<p>購入数を指定してください</p>
<form action="ex05_output.php">
    <select name="count">
        <?php
            #for文
            for($i=0; $i<10; $i++){
                echo "<option value=",$i,">",$i,"</option>";
            }
        ?>
    </select>
    <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>