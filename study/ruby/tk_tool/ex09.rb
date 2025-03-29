require 'tk'


#ex09.rb
#キー + マウスの移動のイベントを処理

root = TkRoot.new do
  title "イベント状態によってbindの内容を変える"
end

root.geometry("400x400+10+10")

root.bind('Motion') do |event|

  #event.stateが修飾キーを示す(具体的な数値は環境依存だが、ビット操作で可能) >> shiftキーを押すとstateメソッドに1が入る
  if event.state & 0x0001 != 0
    puts "Shift + マウス移動：(#{event.x},#{event.y})"
  else
    puts "座標（#{event.x},#{event.y}）"
  end
end

Tk.mainloop