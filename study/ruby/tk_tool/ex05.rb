require 'tk'


#ex05.rb
#ウィンドウで入力したデータをanswer.txtに記入

#メインウィンドウの作成
root = TkRoot.new do
  title "Tkとファイルの操作例"
end

#ラベルウィジェットで説明を表示
label = TkLabel.new(root) do
  text "回答を入力してください"
  pack { padx 10; pady 10; side 'top' }
end

#エントリーウィジェット（ユーザーの入力ボックス）
entry = TkEntry.new(root) do
  width 30
  pack { padx 10; pady 10; side 'top' }
end

#ボタンウィジェット：クリック時にエントリの内容をanswer.txtに書き込む
TkButton.new(root) do
  text '回答を保存'
  command do
    answer = entry.get 
    begin #ファイルを開けたとき
      File.open("answer.txt","a") do |file|
        file.puts answer
      end
    rescue => e #ファイルをうまく開けなかった時
      puts "エラーメッセージ：#{e.message}"
    end


    puts "保存しました"
  end
  pack { padx 10; pady 10; side 'top'}
end

#終了ボタン
TkButton.new(root) do
  text "Quit"
  command {exit}
  pack { padx 10; pady 10; side 'top'}
end

Tk.mainloop





