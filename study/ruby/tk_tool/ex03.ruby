require 'tk'

#ex03.ruby
#commandによるイベント処理

root = TkRoot.new do
  title "イベント処理 - commandの例"
end

entry = TkEntry.new(root) do
  width 30
  pack { padx 10; pady 10; side 'top'}
end

TkButton.new(root) do
  text "入力内容を表示"
  command {puts "入力された内容を表示：#{entry.get}"}
  pack { padx 10; pady 10; side 'top'}
end

label2 = TkLabel.new(root) do
  text "#{entry.get}"
  pack { padx 10; pady 10; side 'top'}
end

TkButton.new(root) do
  text "Quit"
  command {exit}
  pack { padx 10; pady 10; side 'top'}
end

Tk.mainloop

