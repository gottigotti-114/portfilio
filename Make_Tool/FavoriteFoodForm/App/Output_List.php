<?php require "./require/index_head.php" ?>

<!--ナビゲーション設定-->
<nav>
  <ul>
    <li><a href="./Input.php">データの挿入</a></li>
    <li><a href="./Output.php">データの出力</a></li>
    <li><a href="./List.php">データ一覧の出力</a></li>
  </ul>
</nav>

<h3 style="text-align: center;"><?php
  if(isset($_REQUEST['favorite'])){
    echo $_REQUEST['favorite']. "が好きな人一覧"; 
  }elseif(isset($_REQUEST['name'])) {
    echo $_REQUEST['name']. "の好きなもの一覧";
  }  
?></h3>

<?php

  //フォームデータ取得
  $flag = 0;
  if(isset($_REQUEST['name'])) {
    $name = $_REQUEST['name'];
    $flag = 1;
  }
  if(isset($_REQUEST['favorite'])) {
    $favorite = $_REQUEST['favorite'];
    $flag = 2;
  }
  //データベース設定
  $servername = 'localhost';
  $username = 'root5656';
  $password = 'root5656';
  $dbname = 'favorite_things';

  //データベース起動
  $conn = new mysqli($servername,$username,$password,$dbname);

  //接続確認
  if($conn->connect_error) {
    die("接続失敗：". $conn->connect_error);
  }

  //SQLの作成->実行
  if($flag == 1) {
    $sql = "SELECT * FROM favorites WHERE name = '{$name}'";
  }elseif($flag == 2) {
    $sql = "SELECT * FROM favorites WHERE favorite_food LIKE '%{$favorite}%'";
  }
  $result = $conn->query($sql);


  //一覧表示
  if($result->num_rows > 0) {
    echo "<table class='table'>";
    echo "<tr><th>名前</th><th>好きな食べ物</th></tr>";
    while($row = $result->fetch_assoc()) {
      echo "<tr><td>".$row['name']. "</td><td>". $row['favorite_food']. "</td></tr>";
    }
    echo "</table>";
  }else{
    echo "<p>該当なし</p>";
  }

  //データベースを閉じる
  $conn->close();
  ?>


<?php require "./require/index_foot.php" ?>