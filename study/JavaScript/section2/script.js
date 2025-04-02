// DOMが完全に読み込まれた後に実行するため、DOMContentLoadedイベントを使用
document.addEventListener("DOMContentLoaded", function() {
  // ***************************************************
  // 1. メッセージ変更機能
  // ***************************************************
  
  const messageElement = document.getElementById("message");
  const changeTextButton = document.getElementById("changeTextButton");
  
  changeTextButton.addEventListener("click", function() {
    // クリック時にテキストとスタイルを変更
    messageElement.textContent = "こんにちは！JavaScriptでメッセージを更新しました。";
    messageElement.style.color = "blue";
  });
  
  // ***************************************************
  // 2. 簡単なTo-Doリスト機能
  // ***************************************************
  
  const addTaskButton = document.getElementById("addTaskButton");
  const taskInput = document.getElementById("taskInput");
  const myList = document.getElementById("myList");
  
  // タスクを追加する関数
  function addTask() {
    const taskText = taskInput.value.trim();
    if (taskText === "") {
      alert("タスクを入力してください。");
      return;
    }
    
    // 新しいリスト項目（<li>）を作成
    const li = document.createElement("li");
    li.textContent = taskText;
    
    // タスクがクリックされたら削除するイベントを設定
    li.addEventListener("click", function() {
      if (confirm("このタスクを削除しますか？")) {
        li.remove();
      }
    });
    
    // リストに追加
    myList.appendChild(li);
    // 入力欄をクリア
    taskInput.value = "";
  }
  
  // 追加ボタンをクリックしたときにタスクを追加
  addTaskButton.addEventListener("click", addTask);
  
  // キーボードのEnterキーでタスクを追加する処理
  taskInput.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
      addTask();
    }
  });
});