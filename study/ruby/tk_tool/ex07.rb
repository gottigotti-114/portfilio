require 'tk'


#ex07.rb
#bindについてもっと深める

$left_click_cnt = 0
$left_click_current = 0
$current_x = 0
$current_y = 0
$mouse_pointer = false

root = TkRoot.new do
  title "マウス動作デモ"
end

#幅と高さはウィンドウの大きさ、X位置とY位置はウィンドウが生成される位置
#(幅 x 高さ + X位置 + Y位置)
root.geometry("800x600+1+1")

#座標を表示するためのラベル
label_current = TkLabel.new(root) do
  text "マウスポインタを動かしてください"
  font TkFont.new('Arial  14','bold')
  pack { padx 10; pady 10; side 'top'}
end

#左クリックをした時の各数値を表示するためのラベル
label_left_click = TkLabel.new(root) do
  text "マウスを左クリックしてください"
  font TkFont.new('Arial 14','bold')
  pack { padx 10; pady 10; side 'top'}
end

#左クリック時の状態を確認するためのラベル
label_left_click_type = TkLabel.new(root) do
  text "マウスを左クリックしてください"
  font TkFont.new('Arial 14','bold')
  pack { padx 10; pady 10; side 'top'}
end

#マウスの動作を検知するたびに'Motion'イベントをbindする
root.bind('Motion') do |event|
  #event.xはx座標、event.yはy座標
  $current_x = event.x
  $current_y = event.y
  label_current.text = "座標：(#{event.x},#{event.y})"
end

#マウスの左クリックを検知するたびに'Button-1'をbindする
root.bind('Button-1') do |event|
  $mouse_pointer = true
  $left_click_cnt += 1
  label_left_click.text = "左クリックの回数：#{$left_click_cnt}回  クリック時座標(#{$current_x},#{$current_y})"
  label_left_click_type.text = "左クリックの状態：ドラッグ"
end

#マウスの左クリックを離すときに'ButtonRelease-1'をbindする
root.bind('ButtonRelease-1') do |event|
  $mouse_pointer = false
  label_left_click_type.text = "左クリックの状態：ドロップ"
end

Tk.mainloop