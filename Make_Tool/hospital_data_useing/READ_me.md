# 病院・患者の簡易管理システム
## 設計で工夫した点
- ### TKライブラリを使って「system_operator.rb」を実行したらGUIとCUIを使ってデータを入力でき、効率化が図れます。
- ### 患者データをtxtデータで管理し、インプットもアウトプットもすることができます。
- ### File.exist?でファイルの有無を確認して、なかった場合txtファイルの初期化を行い、保存してくれます。
- ### 病名・感染症データであるill_data.txtで全治期間が分からない・もしくは個人差があるものは、「-」を入力することで保留できます。
- ### 患者データを入力すると自動で患者番号がついてきます
- ### 読み込んだデータを配列として読み込みます。
- ### エラーチェックを組み込んでおり、入力ごとにどのデータがどう違っているのか明確に報告することができる。

## 使い方
### 1.まず最初に「ruby system_operator.rb」でGUIを起動します。
### 2.起動したら「患者データを追加」、「患者データを表示」、「症状と退院までの日数表示」と出てくるので、行いたいタスクをクリックして実行します。
### 3.今回は出力先はターミナルとなっているのでターミナルに結果を表示、及び入力もターミナルからになります。

## 反省点(後日記入)
### 後日、前回作った病院・患者の簡易管理システムのプログラムを確認したら、クラス内でメソッドのコードを乱雑にコーディングしていたり、データの転送先がどこか分からなかったり、コメントが漠然としていたりで、複雑化されていたのでクラスとそのメソッドの独立性及びハッシュ配列などで、後からでも再コーディングできるような工夫をしておけばよいと思いました。

### 「human_data.txt」の患者番号は、データベースでいう主キーに値するので、読み込み時を考えて一番手前に記述するべきだと感じました。