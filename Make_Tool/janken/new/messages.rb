# イベントごとにメッセージを送信するクラス
# 引数をプレイヤーの名前とし、enemyかplayerか判別してメッセージを送る
class Messages
  def initialize(name,enemy=0)
    @name,@enemy = name,enemy
  end

  #そのクラスのプレイヤーが攻撃する際のメッセージ
  def attack(damage)
    puts "#{@name}の攻撃！"
    print "#{damage}"
    print "ダメージ与えた！\n" if @enemy == 0
    print "ダメージ食らった！\n" if @enemy != 0
  end

  #勝利メッセージ
  def win
    puts "#{@name}の勝利！！！"
    exit
  end

  #敗北メッセージ
  def lose
    puts "#{@name}の負け..."
    exit
  end
end

#じゃんけんを選ぶメッセージ：返り値は選んだもの
def input_message
  puts "====================="
  ptn = ["グー","チョキ","パー"] #じゃんけんのパターン

  loop do
    puts
    puts "グー・チョキ・パー"
    puts "何を出す？"
    print ">>>"
    type = gets.chomp
    
    #パターンとマッチするまでループ
    if ptn.include?(type)
      puts "====================="
      return type #選んだじゃんけんを返す
    else
      puts "そんなものはない！！"
    end
  end
end

#じゃんけん対決を始める際に出力するメソッド(敵となる相手の名前)
def init_message(bot_name)
  text =
<<~TEXT
|\t===========================\t|
|\t~~~~~~~~~~~~~~~~~~~~~~~~~~~\t|
|\t  じゃんけん対決を始めます   \t|
|\t    相手の名前：#{bot_name}      \t|
|\tルール：HPが0になった方の負け\t|
|\t~~~~~~~~~~~~~~~~~~~~~~~~~~~\t|
|\t===========================\t|
TEXT
  puts text
end

#ゲージを作成し、出力する(数値,ステータス名)
def gage_print(gage,status)# ->99
  if gage <= 0
    puts ""
    return 0
  end
  i = gage / 10
  i += 1 if gage % 10 != 0
  print "(#{status})"
  i.times do
    print "■"
  end
  print " #{gage}\n"
end

#選択セレクター(フェーズ１)を出力し、選択した数値を返す(プレイヤーに関するハッシュ配列)
def select_message(players) #players作り方 配列名 = {name: プレイヤー名, hp: HPの数値, deff: DEFの数値}
  selecter =
<<~TEXT
・じゃんけんをする：１
・魔法技を使う：２
・プレイヤーごとのステータスを見る：３
・リタイアする：４
TEXT
  puts "====================="
  puts "なにを選ぶ？"
  puts
  puts "プレイヤー：#{players[:name]}"
  puts
  gage_print(players[:hp],"HP") #HP,DPのゲージを出力する
  gage_print(players[:dp],"DP")
  puts
  puts selecter

  print ">>>"
  num = gets.to_i #次の選択肢を番号で取得する
  puts "====================="

  return num
end