require 'tk'

#メインウィンドウ生成 >> TkRoot
root = TkRoot.new do
  title "Ruby tk HELLO WORLD"
end

#ラベルウィジェットの作成 >> TkLabel
label = TkLabel.new(root) do
  text "HELLO WORLD"
  pack { padx 20; pady 20;} #packでウィジェット配置。余白を設定
end

#メインループ開始。これでウィンドウが開始され、イベント監視状態に入る
Tk.mainloop
