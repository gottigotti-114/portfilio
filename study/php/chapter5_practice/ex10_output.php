<?php require "../header.php"; ?>

<?php
    #ファイル操作の基本
    #ex10_input.phpでファイルを選択してsubmitボタンで確定をした際に、選択したファイルが一時的にPC内のtmpフォルダーに移動する。

    #その際にどこに移動したかが分かるように$FILES[ファイル名][Tempフォルダーまでのパス]で一時的に保存したファイルがそのパス先にあるか比較して確認したら正を返す
    #そして指定したファイルがあった場合１を返すis_uploaded_file関数
    if(is_uploaded_file($_FILES['file']['tmp_name'])){
        if(!file_exists('upload')){
                #フォルダーを作る関数mkdir
                mkdir('upload');
        }
        # [.]はその前で''で囲った文字列と連結させた文字列を作ることができる
        #basenameはファイルの拡張子込みのファイル名だけを取り出す。
        #本来は$_FILES['file']['name']で絶対パスが返されるが、basenameでそれを阻止する。
        $file='upload/'.basename($_FILES['file']['name']);
        #move_uploaded_file(tmpしたファイルがあるパスとファイル名,保存先のパス名)
        if(move_uploaded_file($_FILES['file']['tmp_name'],$file)){
            echo $file,"のアップロードに成功しました。";
            #保存できたのを視覚的に確認するため、保存したファイルの画像を張り付ける
            echo "<p><img alt='image' src='",$file,"'></p>";
        }else{
            echo "アップロードにしっぱしました。";
        }
    }else{
        echo "ファイルを選択してください";
    }
?>

<?php require "../footer.php"; ?>