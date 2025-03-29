require 'tk'

root = TkRoot.new { title "プルダウンメニューの作成" }
root.geometry("300x300+10+10")

#1.メニューバー用のTkMenuオブジェクトを生成し、ルートウィンドウに設定
menubar = TkMenu.new(root)
root.menu(menubar) #ここで新たにウィンドウにメニューバーを生成

#2.プルダウンメニューの作成
file_menu = TkMenu.new(menubar,tearoff: 0)
menubar.add(:cascade, menu: file_menu, label: "ファイル") #cascadeとは項目を押したらプルダウンが展開する方式

#ファイルメニューの各項目追加
file_menu.add(:command,label: "新規",command: proc { puts "新規作成しました。"})
file_menu.add(:command,label: "開く",command: proc { puts "ファイルを開きました。"})
file_menu.add(:separator) #項目の区切り線
file_menu.add(:command,label: "終了",command: proc { exit })

#編集プルダウンメニューの作成
edit_menu = TkMenu.new(menubar, tearoff: 0)
menubar.add(:cascade,menu: edit_menu, label: "編集")

#編集メニュー各項目追加
edit_menu.add(:command,label: "コピー",command: proc { puts "コピーしました"})
edit_menu.add(:command,label: "貼付け",command: proc { puts "貼り付けました"})

Tk.mainloop