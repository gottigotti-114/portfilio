<?php require "../header.php"; ?>

<p>パスワードを入力してください</p>
<p>(8文字以上で、英小文字、英大文字、数字を各1文字以上含むこと)</p>
<form action="ex06_output.php">
    <!--パスワードを入力する用のテキストボックスはpasswordというタイプで作れる
        この際入力した文字は全て「・」になる-->
    <input type="password" name="password">
    <input type="submit" value="送信">
</form>

<?php require "../footer.php"; ?>