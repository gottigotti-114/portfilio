<?php require "../header.php"; ?>

<?php
    $file = "board.txt";
                                                            #ファイルが現存しているか確認する関数file_exists
    if(file_exists($file)){
                                                            #ファイルを読み込む関数file_get_contents
                                                            #PHPの形式(JSON形式)に変更する関数json_decode
        $board = json_decode(file_get_contents($file));
    }
                                                            #配列に値を追加する
                                                            #パラメータのHTMLタグを無効にさせる関数htmlspecialchars
    $board[] = htmlspecialchars($_REQUEST['message']);
                                                            #追加したmessageの値をJSON形式にするためにjson_encode関数を使う
                                                            #fileへと書き込む関数file_put_contents(書き込むファイル,書き込む内容)
    file_put_contents($file,json_encode($board));
    foreach($board as $message){
        echo '<p>',$message,'</p><hr>';                     #hrは横線を引っ張る
    }
?>

<?php require "../header.php"; ?>