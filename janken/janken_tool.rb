class Janken
  attr_writer :input, :magic, :receive_damage, :receive_buf_attack_damage, :receive_buf_defence
  attr_reader :damage, :defence, :buf_damage, :buf_defence

  def initialize
    @damage, @add_damage = 0, 0
    @magic1, @magic2, @magic3 = "攻撃ダウン", "守備ダウン", "攻撃力アップ"
    @magic1_stock, @magic2_stock, @magic3_stock = 2,2,2
    @my_hp = 200
    @defence = 100
    @buf_damage, @buf_defence = 0, 0
  end

  def init
    @add_damage = 0
    @buf_damage = 0
    @buf_defence = 0
  end

  def data_print
    puts "｜ステータス一覧｜
          HP\t#{@my_hp}\n
          守備力\t#{@defence}"
  end
  #敵・じゃんけんのパターンをランダムで生成
  def output_janken
    ran_num = rand(8) + 1
    case ran_num
    when 1..3
      ans = "グー"
    when 4..6
      ans = "チョキ"
    when 7..9
      ans = "パー"
    end
    @input = ans
  end

  def ptn
      #自分視点の場合パターン
    if @input != nil
      return @input
    else
      #的視点の場合のパターン
      return output_janken
    end
  end

  #じゃんけんのダメージを決める
  #パターンごとに守備力上昇
  def janken_damage(janken_ptn)
    if janken_ptn == "グー"
      @damage = 20 + @add_damage
      @defence += 10
    elsif janken_ptn == "チョキ"
      @damage = 50 + @add_damage
    else
      @damage = 30 + @add_damage
      @defence += 5
    end
  end

  #自分のダメージアップバフ
  def up_damage
    @add_damage += 10
  end

  #自分のダメージダウンバフ
  def down_damage
    @add_damage += -10
  end

  #相手の攻撃力系バフ
  def target_add_damage
    return @buf_damage
  end

  #相手の守備力系バフ
  def target_add_defence
    return @buf_defence
  end

  #アタック時の処理
  def attack
    janken_damage(ptn)
    puts "自分の攻撃！"
    puts "#{@damage}ダメージ当てた！"

  end

  #相手のアタック時の処理
  def attack_enemy
    janken_damage(ptn)
    puts "相手の攻撃！"
    puts "#{@damage}ダメージ当てた！"
  end

  #魔法を使用する際の処理
  def magic_use
    puts "#{@magic}を使った！"
    magic_attack
  end

  #自・魔法データの出力
  def magic_data
    puts "--------------------------------------"
    puts "#{@magic1} #{@magic1_stock}回"
    puts "#{@magic2} #{@magic2_stock}回"
    puts "#{@magic3} #{@magic3_stock}回"
    puts "--------------------------------------"

  end

  #自・魔法使用時の処理
  def magic_attack
    if @magic == @magic1 && @magic1_stock > 0
      @buf_damage += -10
      @magic1_stock -= 1
      puts "攻撃力が10下がった！"
    elsif @magic == @magic2 && @magic2_stock > 0
      @magic2_stock -= 1
      @buf_defence += -10
      puts "守備力が10下がった！"
    elsif @magic == @magic3 && @magic3_stock > 0
      puts "攻撃力が10上がった！"
      up_damage
      @magic3_stock -= 1
    else
      puts "魔法が使えません！"
    end
  end

  #自・ダメージを受けた際の処理
  def receive_attack
    if @receive_damage != 0 && @receive_damage != nil && @receive_damage != ""
      if @defence > 0
        @defence -= @receive_damage
      else
        @my_hp -= @receive_damage
      end
    end
    if @receive_buf_attack_damage != nil && @receive_buf_attack_damage != "" && @receive_buf_attack_damage != 0
      puts "攻撃力が#{@receive_buf_attack_damage}下がった..."
      @add_damage += @receive_buf_attack_damage
    end
    if @receive_buf_defence != nil && @receive_buf_defence != "" && @receive_buf_defence != 0
      puts "守備力が#{@receive_buf_defence}下がった..."
      @defence += @receive_buf_defence
    end
    if @my_hp <= 0
      puts "あなたの負け！"
      exit
    end
  end
end

enemy = Janken.new
my = Janken.new

retia = false
turn_init = 1

#turn1は自分の番、turn0は相手の番
if rand(1) == 0
  turn = 1
  people = "あなた"
else
  turn = 0
  people = "相手"
end


puts "じゃんけんバトルを開始します"
puts "先行は#{people}"
while retia == false
  if turn == 1
    turn = 0
    if turn_init == 1
      puts "|||||||||||||||||||||||||||||||||||||||"
      puts "【【【【自分の番！】】】】"
      puts
      turn_init = 0
    end
    my.data_print
    puts "1:攻撃する 2:魔法を使う 3:魔法データを見る 4:リタイア"
    next_do = gets.to_i
    while !(next_do >= 1 && next_do <= 4)
      puts "番号が違います"
      puts "1:攻撃する 2:魔法を使う 3:魔法データを見る 4:リタイア"
      next_do =gets.to_i
    end
    
    case next_do
    when 1
      puts "-----------------------------"
      begin
        puts "じゃんけんをします！何を出すか決めてください"
        puts "1:グー 2:チョキ 3:パー"
        jan_ptn_num = gets.to_i
      
        case jan_ptn_num
        when 1
          jan_ptn = "グー"
        when 2
          jan_ptn = "チョキ"
        when 3
          jan_ptn = "パー"
        end
      end while !(jan_ptn_num >= 1 && jan_ptn_num <= 3)

      my.input = jan_ptn
      my.attack

      enemy.receive_damage = my.damage
      enemy.receive_attack
      my.init

      puts "------------------------------"
      turn_init = 1
    when 2
      turn = 1
      puts "-----------------------------"
      begin
        puts "魔法を使います"
        my.magic_data
        puts "1:攻撃ダウン 2:守備ダウン 3:攻撃力アップ" 
        magic_num = gets.to_i
        case magic_num
        when 1
          magic = "攻撃ダウン"
        when 2
          magic = "守備ダウン"
        when 3
          magic = "攻撃力アップ"
        end
      end while !(magic_num >= 1 && magic_num <= 3)
      my.magic = magic
      my.magic_use

      enemy.receive_buf_attack_damage = my.buf_damage
      enemy.receive_buf_defence = my.buf_defence
      enemy.receive_attack


      puts "-------------------------------"
    when 3
      turn = 1
      my.magic_data
    when 4
      puts "リタイアしました"
      enemy.data_print
      exit
    end
  elsif turn == 0
    turn = 1
    turn_init = 1
    puts "|||||||||||||||||||||||||||||||||||||||||"
    puts "【【【【相手の番】】】】"
    puts
    r_num1 = rand(2)
    r_num2 = rand(2)
    r_num3 = rand(2)
    if r_num1 != 0
      r_num1.times do
        enemy.magic = "攻撃ダウン"
      end
    end
    if r_num2 != 0
      r_num2.times do
        enemy.magic = "守備ダウン"
      end
    end
    if r_num3 != 0
      r_num3.times do
        enemy.magic = "攻撃力アップ"
      end
    end
    enemy.attack_enemy

    my.receive_buf_attack_damage = enemy.buf_damage
    my.receive_buf_defence = enemy.buf_defence
    my.receive_damage = enemy.damage
    my.receive_attack



  end
end