<?php require "../header.php"; ?>

<p>ご興味のある商品ジャンルを全て選んでください。</p>
<form action="ex09_output.php" method="post">
        <?php
            #チェックボックス
            $genre=["カメラ","パソコン","時計","家電","書籍","文房具","食品"];
            foreach($genre as $text){
                echo '<p><label><input type="checkbox" name="genre[]" value="',$text,'">',$text,'</input><label></p>';
            }
            #※重要：文字列として囲む際にシングルクォーテーションを使ったら文字列内のシングルクォーテーションが
            #       文字として認識されないからダブルクォーテーションに変えないといけない
        ?>
        <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>