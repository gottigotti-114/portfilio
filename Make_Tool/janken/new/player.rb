#Playerメソッド定義(名前,最大HP,最大MPストック数,最大DP,攻撃力,防御力)
class Player
  attr_accessor :name, :hp, :mp, :dp, :atk, :deff, :type, :guard

  def initialize(name="",mhp=0,mmp=0,mdp=0,atk=0,deff=0)
    @name = name
    @mhp,@hp = mhp,mhp #HP設定
    @mp = mmp
    #@mp = Magic.new(mmp) #MP設定(magicクラスに任せる)
    @mdp,@dp = mdp,mdp #DP設定
    @atk,@deff = atk,deff #攻撃力,防御力設定
  end

  #ダメージを受けた際の管理、処理
  def receive_attack(damage,diffence)

    #プレイヤーのdeffに合わせて、ダメージを軽減する(演算：deff10を本来のダメージの10%を軽減するものとする)
    guard = 0.01 * diffence
    @guard = (damage * guard).to_i
    damage -= @guard

    #フラグが１の場合、HPとDPを削る。フラグが０の場合、DPのみ削る
    flag = 1
    if @dp > 0
      if @dp - damage < 0
        damage -= @dp
        @dp = 0
      else
        @dp -= damage
        flag = 0
      end
    end
    if flag == 1
      @hp -= damage
    end
  end

  #バフ効果を受取り、反映する(対象ステータス、バフの数値)
  def receive_buff(status,buff)
    if status == "atk"
      @atk += buff
    elsif status == "deff"
      @deff += buff
    end
  end


  #ステータスをコンソールに表示
  def print
    text =
<<~TEXT
プレイヤー(#{@name})
HP:#{@hp} 
DP:#{@dp}
攻撃力:#{@atk}
防御力:#{@deff}
TEXT
    puts text
  end
end