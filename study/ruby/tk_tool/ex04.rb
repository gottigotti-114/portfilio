require 'tk'

#ex04.rb
#bindを使った処理

#メインウィンドウの生成
root = TkRoot.new do
  title "イベント処理：bindの例"
end

#ラベルに対して左クリックのイベントをバインド
label = TkLabel.new(root) do
  text "ここをクリックしてください"
  pack { padx 10; pady 10; side 'top'}
end

#ラベルが左クリックされたときに文字を表示 >> Button-1はマウスの左クリックのこと
label.bind("Button-1") do
  puts "ラベルがクリックされました！"
end

#キー入力イベントの例：エントリに入力されたキーをリアルタイムに表示
entry = TkEntry.new(root) do
  width 30
  pack { padx 10; pady 10; side 'top'}
end

entry.bind("Key") do |event|
  #event.charメソッドで入力された文字を取得できる
  puts "キー入力：#{event.char}"
end

Tk.mainloop

=begin
結果
bind処理はより詳細なイベント（クリック位置、キー入力）などを取得するのに有効
commandは主にボタンなどに使い、簡潔な処理をするのに向いている
=end
