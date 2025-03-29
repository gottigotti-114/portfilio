require 'tk'


#ex08.rb
#Canvasという範囲を使って座標を取得してみる

root = TkRoot.new do
  title "Canvasを使ってみる"
end

root.geometry("800x600+10+10")

#Canvas上での例
canvas = TkCanvas.new(root) do
  width 400
  height 300
  pack { padx 10; pady 10; side 'top'}
end

#Canvas内でのマウスイベント
canvas.bind('Motion') do |event|
  #canvas内での座標取得
  puts "座標（#{event.x},#{event.y}）"
end

Tk.mainloop