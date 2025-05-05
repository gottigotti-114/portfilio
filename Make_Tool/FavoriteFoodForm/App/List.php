<?php require "./require/index_head.php"; ?>

<!--ナビゲーション設定-->
<nav>
  <ul>
    <li><a href="./Input.php">データの挿入</a></li>
    <li><a href="./Output.php">データの出力</a></li>
    <li><a href="./List.php">データ一覧の出力</a></li>
  </ul>
</nav>

<h3 style="text-align: center;">データベース一覧</h3>
<?php
//データベース情報指定
$severname = 'localhost';
$username = 'root5656';
$password = 'root5656';
$dbname = 'favorite_things';

//MySQLに接続
$conn = new mysqli($severname,$username,$password,$dbname);

//接続チェック
if($conn->connect_error) {
  die("接続失敗：". $conn->connect_error);
}

//SQLクエリの準備（必要なフィールドのみ取得）
$sql = "SELECT name, favorite_food FROM favorites";
$result = $conn->query($sql);

//データ取得処理
if($result->num_rows > 0) {
  echo "<table class='table'>";
  echo "<tr><th>Name</th><th>Favorite_food</th></tr>";

  while($row = $result->fetch_assoc()) {
    echo "<tr><td>" . htmlspecialchars($row["name"]). "</td><td>". htmlspecialchars($row['favorite_food']). "</td></tr>";
  }

  echo "</table>";
}else{
  echo "データが見つかりません";
}

//接続を閉じる
$conn->close();
?>

<?php require "./require/index_foot.php"; ?>