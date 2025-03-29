require 'tk'

#メソッドで使用するグローバル変数
$seed_num = 957295

#乱数生成メソッド
class Maker
  attr_reader :type, :type_text

  def make_num(max=nil , min=nil)
    if max == nil || min == nil
      puts "エラー：正しい引数を設定してください"
      puts "メソッド：calc"
    else
      $seed_num = srand(Time.now.to_i * $seed_num)
      return (rand(max-min+1) + min).to_i
    end
  end

  def make_type
    type_text = 
    type = ["wa","sa","seki","shou"]

    $seed_num = srand(Time.now.to_i * $seed_num)
    
    num = rand(4)
    @type_text = type_text[num]
    @type = type[num]
  end
end
calc = Make.new

#ウィンドウで使用するグローバル変数
$calc_mode = "+"
$calc_type = "wa"
$calc_text = "全て"
$formula = { num1: calc.make_num(9,1),num2: make_num(9,1)}
case $calc_type
when "wa"
  $formula[:ans] = $formula[:num1] + $formula[:num2]
  $calc_mode = 
when "sa"
  $formula[:ans] = $formula[:num1] - $formula[:num2]
when "seki"
  $formula[:ans] = $formula[:num1] * $formula[:num2]
when "shou"
  $formula[:ans] = $formula[:num1] / $formula[:num2]
end

#計算ドリルウィンドウの作成
root = TkRoot.new do
  title "計算ドリル"
end

root.geometry("400x400+30+30")

## 注意点：ウィンドウGUIのラベル等はメニューバーの前に書かないと、メニューバーを起動させても存在していないラベル(読み込み、初期化されていないラベル)があり、うまくいかないことがある ##
## 　　　　ここで重要なのは上から順に読み取られていること ##

#計算メニュー表示ラベル
calc_label = TkLabel.new(root) do
  text "計算メニュー：#{$calc_text}"

  font TkFont.new('Arial 18','bold')
  pack { padx 10; pady 10; side 'top'}
end

#数式表示用ラベル
math_label = TkLabel.new(root) do
  text "#{$formula[:num1]} #{$calc_mode}"
#回答取得エントリ

#ヒント表示ラベル

#ヒント表示ボタン

#Nextボタン













#メニュー設定ナビゲーション
menubar = TkMenu.new(root)
root.menu(menubar)

#計算メニュー設定
calc_menu = TkMenu.new(menubar, tearoff: 0)
menubar.add(:cascade, menu: calc_menu, label: "計算メニュー")
#計算モードを和に変更
calc_menu.add(:command, label: "足し算", command: proc {
  puts "計算モード変更：和"
  $calc_type = "wa"
  $calc_text = "和"
  calc_label.text = "計算メニュー：#{$calc_text}" #>> $calc_text = "和"で変更してもラベルは変わらない。変更した後にラベル自体を更新しないといけない。
})
#計算モードを差に変更
calc_menu.add(:command, label: "引き算", command: proc{
  puts "計算モード変更：差"
  $calc_type = "sa"
  $calc_text = "差"
  calc_label.text = "計算メニュー：#{$calc_text}"
})
#計算モードを積に変更
calc_menu.add(:command, label: "掛け算", command: proc{
  puts "計算モード変更：積"
  $calc_type = "seki"
  $calc_text = "積"
  calc_label.text = "計算メニュー：#{$calc_text}"
})
#計算モードを商に変更
calc_menu.add(:command, label: "割り算", command: proc{
  puts "計算モード変更：商"
  $calc_type = "shou"
  $calc_text = "商"
  calc_label.text = "計算メニュー：#{$calc_text}"
})
#計算モードを全てに変更 => ジャンルを和、差、積、商に絞る
calc_menu.add(:command, label: "全て", command: proc{
  puts "計算モード変更：全て"
  $calc_mode = "all"
  $calc_text = "全て"
  calc_label.text = "計算メニュー：#{$calc_text}"
})

#データの扱いに関するメニュー
data_menu = TkMenu.new(menubar, tearoff: 0)
menubar.add(:cascade, menu: data_menu, label: "データ")

#データの保存
data_menu.add(:command, label: "保存", command: proc{
  puts "データを保存しました"
})
#データの新規作成
data_menu.add(:command, label: "新規", command: proc{
  puts "データを新規作成しました"})




Tk.mainloop