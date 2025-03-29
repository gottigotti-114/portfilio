require 'tk'


#ex02.ruby
#基本ウィジェットを使ったコード >> エントリ(Entry)クラスを使用

root = TkRoot.new do
  title "ex02.ruby"
end

label = TkLabel.new(root) do
  text "Welcome to Ruby"
  pack{ padx 10; pady 10; side 'top'}
end

#入力場所を作る >> 入力場所はentry.getメソッドに格納される
entry = TkEntry.new(root) do
  width 30
  pack{ padx 10; pady 10; side 'right'}
end

TkButton.new(root) do
  text "内容を表示"
  command{puts "入力された内容：#{entry.get}"}
  pack{ padx 10; pady 10; side 'top'}
end

TkButton.new(root) do
  text "Quit"
  command{exit}
  pack{ padx 10; pady 10; side 'top'}
end

Tk.mainloop