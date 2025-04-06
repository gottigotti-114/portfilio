<?php require "../header.php"; ?>

<form action="ex03_output.php">
    <!--ラジオボタン-->
    <p><label><input type="radio" name="meal" value="和食" checked>和食</label></p>
    <p><label><input type="radio" name="meal" value="洋食">洋食</label></p>
    <p><label><input type="radio" name="meal" value="中華">中華</label></p>
    <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>