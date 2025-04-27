require_relative "event"
require_relative "janken"
require_relative "magic"
require_relative "messages"
require_relative "player"

##################################################################
# ゲームを実行するうえでの設定をつける
##################################################################

#初期名前入力
print "自分の名前を決めてください>>"
myName = gets.chomp
puts
print "敵の名前を決めてください>>"
enemyName = gets.chomp


#ステータスのインスタンス設定
player = Player.new(myName,100,3,100,10,10) #自分のステータスを設定
enemy = Player.new(enemyName,100,3,100,10,10) #敵のステータスを設定

#それぞれが使える魔法技をハッシュ化し、インスタンス化する
magic_code = {
  a01: { magic: "祈る", target: "敵", status: "atk", buff: -10},
  a02: { magic: "怒り", target: "自分", status: "atk", buff: 10}
}
player_magic = Magic.new(magic_code,player.mp) #自分の魔法技を設定
enemy_magic = Magic.new(magic_code,enemy.mp,0) #敵の魔法沢を設定

#プレイヤーごとメッセージをインスタンス化
player_message = Messages.new(player.name) #プレイヤーの名前をもとにメッセージ機能を設定
enemy_message = Messages.new(enemy.name,1) #敵の名前をもとにメッセージ機能を設定

#技を構成 ->1チョキ 2パー 3グー  ※この場合、配列としているので添え字を一つ上げた値がじゃんけんコードになる
janken_type = [
  Janken.new(40,0,"hp","チョキ"),
  Janken.new(20,40,"hp","パー"),
  Janken.new(30,20,"deff","グー")
]

#ターミナルで十分な間を開けるための変数
air =
<<~TEXT






TEXT

##############################################
# 1. ゲームの開始 -> 何をするか選択
##############################################


#ゲーム開始のメッセージ
init_message(enemy.name)
sleep(5)
#じゃんけんゲーム開始！！
turn = 1 #最初のターン
while(100 >= turn)
  #もしも自分か相手のHPがゼロだったら？
  if player.hp <= 0
    puts "#{player.name}の負け..."
    sleep(3)
    exit
  elsif enemy.hp <= 0
    puts "#{player.name}の勝ち！！！"
    sleep(3)
    exit
  end

  puts air
  turn_text = "#{turn} / 100 ターン"
  turn_text.each_char do |char|
    print char
    sleep(0.3)
  end
  print "\n"
  sleep(2)

  #ここのCase文は、何をするかセレクトメニューをメソッドで出力し、番号を受け取る
  select_num = 0
  begin

    #プレイヤーのステータスをハッシュ配列に格納
    player_status = {name: player.name,hp: player.hp,dp: player.dp}
    #プレイヤーのHP,DPを表示 -> 選択メニューを表示
    select_num = select_message(player_status)
    puts air
    case select_num
    #＜＜＜じゃんけんぽん＞＞＞
    when 1
      #プレイヤーがこのターンで使うじゃんけんを決める
      player.type = input_message

      #BOTがこのターンで使うじゃんけんを決める
      enemy.type = make_type
    #＜＜＜魔法技の使用＞＞＞
    when 2
      player_magic.print
      puts
      puts "どの魔法技を使いますか？"
      print ">>>"

      #受け取った魔法技を魔法コードに変換する
      code = player_magic.magicToCode(gets.chomp)
      #受け取った魔法コードを魔法クラスに持っていき、管理する（魔法技の結果を配列として受け取る）
      magic_arr = player_magic.magic_use(code)
      #受け取った結果[ターゲット,対象ステータス,具体的な数値]をそれぞれプレイヤーに割り当てる
      if magic_arr != 0

        if magic_arr[0] == "自分"
          player.receive_buff(magic_arr[1],magic_arr[2])
        else
          enemy.receive_buff(magic_arr[1],magic_arr[2])
        end
      end
      3.times do
        sleep(0.3)
        print "."
      end

      #魔法技使用時の出力
      sleep(0.3)
      print "魔法を使った！！\n"

      sleep(1.5) if magic_arr == 0 #魔法技のMPが0だった時の処理
      puts "しかし、何も起こらなかった..." if magic_arr == 0

      sleep(0.5)
      puts air
      puts

    #＜＜＜プレイヤーと相手のステータスを一覧表示する＞＞＞
    when 3
      sleep(0.2)
      puts air
      puts
      puts "====================="
      player.print
      puts "====================="
      sleep(4)
      enemy.print
      puts "====================="
      sleep(4)
      puts air
    #＜＜＜リタイア＞＞＞
    when 4
      puts "#{player.name}の負け..."
      exit
    end
    sleep(1)
  end while select_num != 1

  ##################################################
  # 2. 選択 -> じゃんけんぽんを開始 -> ジャッジする
  ##################################################

  sleep(1)
  #いざ、勝負！！
  puts air
  print "じゃんけん"
  3.times do
    sleep(0.5)
    print "."
  end
  puts air
  sleep(1)
  puts "ぽん！！"
  puts "#{player.name}:#{player.type}  VS  #{enemy.name}:#{enemy.type}"
  sleep(2)
  #勝負の結果をジャッジし、結果をkekkaに入れ、適切な相手にクリティカルダメージを与える
  #選んだじゃんけんごとに、それぞれダメージを入れる
  kekka = judge(type_change(player.type),type_change(enemy.type))

  ##################################################
  # 3.勝敗がついたのでダメージ計算をする -> ダメージの反映
  ##################################################

  #プレイヤーごとにダメージ換算
  enemy_damage = attack_calc(janken_type[type_change(player.type)-1].damage,player.atk)
  player_damage = attack_calc(janken_type[type_change(enemy.type)-1].damage,enemy.atk)


  #結果に基づいてクリティカルダメージを付与する
  if kekka != 0
    if kekka == type_change(player.type)
      enemy_damage *= 2
    else
      player_damage *= 2
    end
  end

  #ダメージをそれぞれのプレイヤーに割り当てる
  enemy.receive_attack(enemy_damage,enemy.deff)
  player.receive_attack(player_damage,player.deff)

  #じゃんけんの種類に応じてバフを与える
  player.receive_buff(janken_type[type_change(player.type)-1].status,janken_type[type_change(player.type)-1].heal)
  enemy.receive_buff(janken_type[type_change(enemy.type)-1].status,janken_type[type_change(enemy.type)-1].heal)
  #ダメージが入ったのでメッセージを出力する
  p_text =
<<~TEXT



===================================
プレイヤー：#{player.name}
#{player_damage}ダメージ受けた...
#{player.guard}ダメージ抑えた！！
残りHP：#{player.hp}
残りDP：#{player.dp}

<<ステータス>>
攻撃力：#{player.atk}
防御力：#{player.deff}
===================================
TEXT

e_text =
<<~TEXT



===================================
敵：#{enemy.name}
#{enemy_damage}ダメージ与えた！！
#{enemy.guard}ダメージ軽減した...
残りHP：#{enemy.hp}
残りDP：#{enemy.dp}

<<ステータス>>
攻撃力：#{enemy.atk}
防御力：#{enemy.deff}
===================================

TEXT

  puts p_text
  sleep(5)
  puts e_text
  sleep(5)

  #次のターンへ
  turn += 1
end