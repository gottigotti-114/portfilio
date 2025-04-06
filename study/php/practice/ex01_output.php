<?php require "../header.php" ?>
<?php
    $file = "file.txt";
    $file2 = "name.txt";
    if(file_exists($file2)){
        $name_board = json_decode(file_get_contents($file2));
        $name_board[] = htmlspecialchars($_REQUEST['name']);
        file_put_contents($file2,json_encode($name_board));
        if(file_exists($file)){
            $board = json_decode(file_get_contents($file));
            $board[] = htmlspecialchars($_REQUEST['message']);
            file_put_contents($file,json_encode($board));
    
        }
    }
    
    $i = 0;

    foreach($board as $text){
        echo "<p>",$i,">>";
        echo " ",$name_board[$i],"さん</p>";
        echo "<p>",$text,"</p><hr>";
        $i++;
    }

?>

<form action="ex01_output2.php" method="post" >
    <div class="static_range">
        <p>お名前<input type="text" name="name"></p>
        <p>本文<input type="text" name="message"></p>
        <input type="submit" value="送信">
    </div>
</form>


<?php require "../footer.php" ?>