# Magicクラス定義方法
# 引数１：魔法攻撃に関するデータを取得する -> 二次元ハッシュ配列で定義 -> [
# 魔法技のコード: {
#   magic: 魔法攻撃の名前,
#   target: バフの対象となるプレイヤー,
#   status: バフの対象となるステータス
#   buff: バフの具体的な数値(プラスなら整数,マイナスなら負の数)
# }]
# 引数２：魔法攻撃のMP(最大ストック数を定義)

class Magic
  attr_accessor :max

  #魔法技の二次元ハッシュ配列の作成
  #一つの魔法技にコードを振る：1次配列時
  #魔法技に様々な設定を加える：二次配列時
  def initialize(magic_data,max,enemy=0)

    @code = [] #作った技コードのハッシュキーを保存しておく場所
    @magic = [] #作った技名を保存しておく場所 -> のちにcodeとmagicの配列をリンクさせるため
    @enemy = enemy #もしも敵側だったらenemyが0以外になる
    @data = Hash.new{|hash,key| hash[key] = {}} #ハッシュ配列に最初にnilが入っているとエラーになるので、初期化しておく

    magic_data.each do |key1,arr|
      arr.each do |key2,data|
        # to_symメソッドは変数内のデータをそのまま、ハッシュのキーに変換してくれる
        @data[key1.to_sym][key2.to_sym] = data
      end
      @data[key1.to_sym][:stock] = max
      @code << key1 #技コードをメモしておく
      @magic << arr[:magic] #技名をメモしておく
    end
  end

  #魔法技を使用する際のメソッド
  # 引数は使用する魔法技コード
  # 返り値は魔法配列 -> [プレイヤーターゲット,対象ステータス,バフ％]
  def magic_use(code) #codeは技のコード
    if @data[code.to_sym][:stock] == 0
      return 0
    else
      @data[code.to_sym][:stock] -= 1
      arr = []
      arr[0] = @data[code.to_sym][:target]
      arr[1] = @data[code.to_sym][:status]
      arr[2] = @data[code.to_sym][:buff]
      arr[3] = "enemy" if @enemy != 0 #もしも敵視点だった場合、返り値にenemyをつけて見分ける
    end
    return arr #返り値として上記メッセージの配列を返す
  end

  #魔法技のストック数や効果を一覧表示する
  def print
    puts "===魔法技：MP一覧==="
    @code.each do |key|
      puts
      puts "#{@data[key.to_sym][:magic]}：#{@data[key.to_sym][:stock]}個ストック"
      puts "用途：#{@data[key.to_sym][:target]}の#{@data[key.to_sym][:status]}を#{@data[key.to_sym][:buff]}増やす" if @data[key.to_sym][:buff] > 0
      puts "用途：#{@data[key.to_sym][:target]}の#{@data[key.to_sym][:status]}を#{@data[key.to_sym][:buff]}減らす" if @data[key.to_sym][:buff] < 0
    end
    puts "==================="
  end

  #受け取った魔法技名を魔法コードに変換
  def magicToCode(magic_in)
    i = 0
    @magic.each do |magic|
      return @code[i] if magic == magic_in
      i += 1
    end
  end


end
