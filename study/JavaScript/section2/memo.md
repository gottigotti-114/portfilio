# セクション２のメモ
## メソッドの種類と意味
- addEventListenerメソッド

  イベント（クリック、キーボード、スクロール）発生した際に実行されるメソッド

  ```Javascript
  document.addEventListener("イベント名", function () {} )
  ```

- getElementByIdメソッド

  htmlファイルで付けたidのタグから取得したメッセージ(インスタンス)を受け取る

  ```Javascript
  document.getElementById("id名")
  ```

- valueメソッド , trimメソッド

  valueメソッドはテキストボックスのインプットデータを持ってくる。
  ※textContentメソッドと混ざりやすいが、valueメソッドはユーザーが入力したデータのみを扱う

  trim()メソッドは文字列の先頭にあるスペースやタブ、インデントを自動的に消してくれる

  ```Javascript
  変数名.value.trim()
  ```

- alertメソッド

  ブラウザのウィンドウ上にメッセージを表示する

  ```Javascript
  alert("タスクを表示してください")
  ```

- createElementメソッド , textContentメソッド

  createElementメソッドは、取得したインプットデータなどにHTML要素(タグ名)をつけることができる

  textContentメソッドは要素内のテキスト(タグで挟まれた内容)を取得する

  ```Javascript
  const li = document.createElement("li");
  li.textContent = taskText;
  ```

- confirmメソッド

  ウィンドウでユーザーにYesかNoかの可否を問う。
  もしもYesならtrue、Noならfalseが返る

  ```Javascript
  if(confirm("このタスクを削除しますか？")){};
  ```

- removeメソッド , appendChildメソッド

  removeメソッドは特定の要素を削除する。今回はli要素を削除する

  appendChildメソッドは指定した親要素に子要素を追加する

  ```Javascript
  const 変数名 = document.createElement("li");
  //liの要素となった変数名を削除
  変数名.remove();

  //id名がmyListのul要素を取得
  const myList = document.getElementById("myList");
  //myListに子要素を追加
  myList.appendChild(li);
  ```

## 最後の方のEnterキーでタスク追加処理について

- function(event)のeventとは

  そのイベント(keydown)が発生したときに、キーボードから送られてきた内容が入っているメソッド、それがeventである

- event.key === "Enter"とは

  event.keyはインプットキーボードデータメソッドであるeventの何のキーボードが押されたかのデータが入っているメソッドがkeyメソッドである。

  ``豆知識：``
  ``event.key === "Enter"の===とは。``
  ``===は厳密な判定(型も数値も全て一緒)の時に使われる。``
  ``==は甘い判定(数値は一緒だが型は不一致)の時などに使われる``
