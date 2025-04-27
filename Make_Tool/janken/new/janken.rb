#じゃんけんの種類を格納しておくクラス(ダメージ数,回復量,回復させるもの,じゃんけん)
class Janken
  attr_accessor :damage, :heal, :status

  def initialize(damage,heal=0,status=0,type)
    @damage = damage
    @heal,@status = heal,status
    @type = type
  end

  #じゃんけんのパターン別のダメージ構成、ステータスを出力する
  def print
    puts "#{@type}：相手に#{@damage}ダメージ与える"
    puts "バフ効果：自分の#{@status}が#{@heal}ほど回復する"
  end
end


#じゃんけん勝負をして買った方のじゃんけんコードを返す(じゃんけん１,じゃんけん２)
def judge(p1_num,p2_num)
  judge = p1_num-p2_num
  ans = 0 #あいこなら0を返す
  ans = p1_num if [-1,2].include?(judge) #じゃんけんで(前者のじゃんけんコード - 後者のじゃんけんコード)をした結果、-1と2が前者が勝利したパターンになる
  ans = p2_num if [1,-2].include?(judge) #これは後者勝利パターン
  return ans
end

#じゃんけんをじゃんけんコードに変換する(じゃんけん)
def type_change(type)
  num = 3 if type == "グー"
  num = 2 if type == "パー"
  num = 1 if type == "チョキ"
  return num
end

#じゃんけんコードをじゃんけんに変換する(じゃんけんコード)
def num_change(num)
  type = "グー" if num == 3
  type = "パー" if num == 2
  type = "チョキ" if num == 1
  return type
end

#クリティカル時にダメージを二倍にする
def critical(damage)
  return damage * 2
end

#BOTのためのじゃんけんのパターンを生成する{{乱数使用}}
def make_type
  system("ruby make_seed.rb") #乱数生成プログラムのmake_seed.rbを実行
  seed = 0
  File.open("seed_file.txt","r") do |file| #生成されたシード値(seed_file.txt)を取得
    seed = file.read.to_i
  end

  srand(seed)
  num = rand(3) + 1 #生成された数値を、そのままじゃんけんコードとして利用

  return num_change(num)
end