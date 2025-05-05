<?php require "./require/index_head.php"; ?>

<!--ナビゲーション設定-->
<nav>
  <ul>
    <li><a href="./Input.php">データの挿入</a></li>
    <li><a href="./Output.php">データの出力</a></li>
    <li><a href="./List.php">データ一覧の出力</a></li>
  </ul>
</nav>

<!--フォームの作成 -> 送信-->
<form action="./Confirm.php" method="post">
  <label>
    <p>名前を入力してください</p><br>
    <input type="text" name="name" class="form_box">
  </label><br>

  <label>
    <p>お気に入りの食べ物を入力してください</p><br>
    <input type="text" name="favorite" class="form_box">
  </label><br>

  <input type="submit" value="送信" class="submit">
</form>

<?php require "./require/index_foot.php"; ?>