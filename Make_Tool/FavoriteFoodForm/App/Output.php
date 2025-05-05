<?php require "./require/index_head.php" ?>

<!--ナビゲーション設定-->
<nav>
  <ul>
    <li><a href="./Input.php">データの挿入</a></li>
    <li><a href="./Output.php">データの出力</a></li>
    <li><a href="./List.php">データ一覧の出力</a></li>
  </ul>
</nav>

<h1 style="text-align: center;">指定したユーザ情報を表示します</h1>
<div class="zone1">
  <form action="Output_List.php" method="post">
    <label><p>ユーザ名指定</p><br>
    <?php
    //データベース設定を決める
    $servername = 'localhost';
    $username = 'root5656';
    $password = 'root5656';
    $dbname = 'favorite_things';

    //データベースに接続
    $conn = new mysqli($servername,$username,$password,$dbname);

    //接続確認
    if($conn->connect_error) {
      die("接続失敗：". $conn->connect_error);
    }

    //SQLの作成->データの取得
    $sql = "SELECT DISTINCT name FROM favorites";
    $result = $conn->query($sql);
  
    //セレクトボタンの作成
    echo "<select name='name' id='select'>";
    if($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        echo "<option value='". $row['name']. "'>". $row['name']. "</option>";
      }
    }else{
      echo "<option value=0>該当なし</option>" ;
    }
    echo "</select>";

    //データベースを閉じる
    $conn->close();
    ?>
    </label><br>

    <input type="submit" value="抽出" class="submit">
  </form>
</div>

<div class="zone2">
  <form action="Output_List.php" method="post">
    <label><p>好きな食べ物を指定</p><br>
    <?php
    //データベース設定を決める
    $servername = 'localhost';
    $username = 'root5656';
    $password = 'root5656';
    $dbname = 'favorite_things';

    //データベースに接続
    $conn = new mysqli($servername,$username,$password,$dbname);

    //接続確認
    if($conn->connect_error) {
      die("接続失敗：". $conn->connect_error);
    }

    //SQLの作成->データの取得
    $sql = "SELECT DISTINCT favorite_food FROM favorites";
    $result = $conn->query($sql);
  
    //セレクトボタンの作成
    echo "<select name='favorite' class='select'>";
    if($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        echo "<option value='". $row['favorite_food']. "'>". $row['favorite_food']. "</option>";
      }
    }else{
      echo "<option value=0>該当なし</option>" ;
    }
    echo "</select>";

    //データベースを閉じる
    $conn->close();
    ?>
    </label><br>

    <input type="submit" value="抽出" class="submit">
  </form>
</div>

<?php require "./require/index_foot.php" ?>