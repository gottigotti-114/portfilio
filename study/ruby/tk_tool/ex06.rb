require 'tk'

#1.問題生成メソッド
def generate_problem
  a = rand(1..20)
  b = rand(1..20)
  [a,b,a+b]
end

#2.グローバル変数で現在の問題を維持
a, b, answer = generate_problem
$current_problem = {a: a,b: b,answer: answer}

#3.メインウィンドウの生成
root = TkRoot.new do
  title "計算ドリル"
end

#4.ウィジェットの作成

#問題表示用ラベル
problem_label = TkLabel.new(root) do
  text "問題：#{$current_problem[:a]} + #{$current_problem[:b]} = ？"
  font TkFont.new('Helvetica 18 bold')
  pack { padx 10; pady 10; side 'top'}
end

#回答入力用エントリ
answer_entry = TkEntry.new(root) do
  width 10
  font TkFont.new('Helvetica 18')
  pack { padx 10; pady 10; side 'top'}
end

#結果表示用ラベル
result_label = TkLabel.new(root) do
  text ""
  foreground "blue"
  font TkFont.new('Helvetica 16')
  pack { padx 10; pady 10; side 'top'}
end

TkButton.new(root) do
  text "回答を確認"
  font TkFont.new('Helvetica 16')
  command do
    #回答を取得
    user_input = answer_entry.get.strip

    #正解かチェック
    if user_input == $current_problem[:answer].to_s
      result = "正解"
    else
      result = "不正解：正解は#{$current_problem[:answer]}"
    end
    
    result_label.text = result
  
    #回答結果をanswer.txtに記入
    File.open("answer.txt","a") do |file|
      file.puts "問題：#{$current_problem[:a]} + #{$current_problem[:b]} = 回答：#{user_input} 結果：#{$current_problem[:answer]}"
    end

    #次の問題を生成し、表示を更新する
    a, b, answer = generate_problem
    $current_problem = {a: a,b: b,answer: answer}
    problem_label.text = "問題：#{$current_problem[:a]} + #{$current_problem[:b]} = ？"
    answer_entry.delete(0, 'end')
  end
  pack { padx 10; pady 10; side 'top'}
end

#終了ボタン
TkButton.new(root) do
  text "Quit"
  font TkFont.new('Helvetica 16')
  command {exit}
  pack { padx 10; pady 10; side 'top'}
end

#メインイベントループ開始
Tk.mainloop


