<?php require "../header.php"
#掲示板を作る
?>



<form action="ex01_output.php" method="post" >
    <div class="static_range">
        <p>お名前<input type="text" name="name"></p>
        <p>本文<input type="text" name="message"></p>
        <input type="submit" value="送信">
    </div>
</form>

<?php require "../footer.php" ?>