#test_class.txtは今まで制作した問題に含まれる分野が全て入っている
#test_file.txtは保存された問題番号,問題文,分野,答え,が全て書かれている

#入力されたデータを取り扱うクラス
class Problem_data_in
  #attr_accessor :mon_input, :bun_input, :kot_input, :mon_num, :bunya_in

  #データの設定
  #@mondai->問題文 @bunya->分野 @kotae->答え
  #@mon_num->test_file.txtに挿入する際の正しい問題番号 @bunya_all->分野を一覧表示する際に格納するための配列
  def initialize(mon_input = "",bun_input = "",kot_input = "")
    @mondai, @bunya, @kotae = mon_input, bun_input, kot_input
    @mon_num = 0
    @bunya_all = [["全て"]] #.strip.split(',')を使うとtest_class.txtを二次元配列として取り込んでしまうため、.firstがうまく活用されなくなってしまうからあえて二次元配列にしておく
                            #最初から"全て"を入れておくことでbunya_printメソッドを乱用するときに全てという分野を入れてもOKということを分かりやすくする。
                            #"全て"という分野を作ることでその問題がどの分野でもないことを意味することもできる
  end
  #過去に生成された分野をクラス配列bunya_allに代入
  def bunya_input
    File.open("test_class.txt","r") do |file|
      file.each_line do |record|
        @bunya_all << record.strip.split(',')
      end
    end
  end
  #次に入れる適当な問題番号を得るための処理
  def number_input
    data = []
    num = 0
    File.open("test_file.txt","r") do |file|
      file.each_line do |record|
        data << record.strip.split(',')
      end
    end
    data.each do |record|
      num = record[0].to_i  #data[0]の番号の最後尾をnumに代入する
    end
    @mondai_num = num + 1
  end

  #過去の分野を全表示
  def bunya_print
    bunya_input
    puts "-----------------"
    puts "今まで入力した分野"
    puts "-----------------"
    @bunya_all.each do |text|
      puts text
    end
    puts "-----------------"
  end

  #記入された新たなデータをtest_class.txtとtest_file.txtにそれぞれ挿入する
  def input
    bunya_input
    check_bunya = true
    #もしもtest_classにすでに同じ分野があるなら追加しない
    @bunya_all.each do |bunya_text|
      puts bunya_text
      if bunya_text.first == @bunya   #firstの意味 ->.each |text|で取り出されるtextには["Hello World"]という形で取り出され、[]や"などの邪魔なものが入っているのでfirstで最初の要素のみを指定する
        check_bunya = false
      end
    end
    #もしも追加可能ならtest_class.txtに分野を追加
    if check_bunya == true
      File.open("test_class.txt","a") do |file|
        file.puts "#{@bunya},"
      end
    end
    #入力されたデータをtest_file.txtに追加
    File.open("test_file.txt","a") do |file|
      number_input  #@mondai_numを取得
      file.puts "#{@mondai_num},#{@mondai},#{@bunya},#{@kotae},"
    end
  end
end

class Problem_data_out
  #データの設定
  #@mondai_num_max-> 問題をいくつ出すか設定する。while文の最大値として代用
  #@bunya-> 分野別出題のために設定する
  def initialize(mondai_num_max=10,bunya="全て")
    @mondai_num_max = mondai_num_max
    @bunya = bunya
  end

  #問題一つ一つをインスタンスとする
  class Mondai
    attr_reader :number, :mondai, :bunya, :kotae
    attr_accessor :version, :answer, :joutai
    #@number->問題番号 @mondai->問題文 @bunya->分野 @kotae->答え
    def initialize(number,mondai,bunya,kotae)
      @number,@mondai,@bunya,@kotae = number,mondai,bunya,kotae
      @version = 0 #0はまだ未回答,1は回答済み
      @answer = "" #回答されたデータがここに入る
      @joutai = "" #もしもあっていれば〇,違っていれば☓が入る
    end

    #答え合わせをする処理 -> 結果は@joutaiに格納
    def answer_check
      if @answer == @kotae
        @joutai = "〇"
      else
        @joutai = "☓"
      end
    end
  end

  #テストをスタートする
  def test_start

    puts "----------------"
    puts "|テストを始めます|"
    puts "----------------"
    
    #test_file.txtから分野別に問題を抽出
    mondai_in = []
    File.open("test_file.txt","r") do |file|
      file.each_line do |record|
        mondai_in << record.strip.split(',')  #全ての問題文をmondai_inに格納
      end
    end
    mondai_w = []
    if @bunya == "全て"
      mondai_in.each do |record|
        mondai_w << record
      end
    else
      mondai_in.each do |record|
        if record[2] == @bunya
          mondai_w << record  #分野が一致した問題文だけをmondai_wに格納
        end
      end
    end

    #問題一つ一つをインスタンスとして生成
    mondai = []
    mondai_num = 0
    mondai_w.each do |record|
      mondai << Mondai.new(record[0],record[1],record[2],record[3])
      mondai_num += 1
    end

    #テストを開始する
    cnt = 0
    while cnt < @mondai_num_max && cnt < mondai_num
      rnd_cnt = 0 #srandでシード値による乱数の粒度を変えるためにシード値を設定
      begin
        rnd_cnt += 1
        srand(rnd_cnt)
        no = (rand*1000).to_i % mondai_num  #noにランダムな値を格納し、配列mondaiの添え字とする
      end while mondai[no].version != 0
      
      puts "問題#{cnt+1} 問題番号：#{mondai[no].number} 分野：#{mondai[no].bunya}"
      puts "---------------------------------"
      puts "問題文"
      puts mondai[no].mondai
      print "あなたの回答>>"
      mondai[no].answer = gets.chomp
      puts "---------------------------------"
      mondai[no].version = 1
      mondai[no].answer_check
      cnt += 1
    end

    #答え合わせ
    yes_cnt = 0
    no_cnt = 0
    mondai.each do |mondai_check|
      #@joutaiが正解であるか、@versionが回答済みであるか確認して正答数を判断する
      if mondai_check.joutai == "〇" && mondai_check.version == 1
        yes_cnt += 1
      elsif mondai_check.joutai == "☓" && mondai_check.version == 1
        no_cnt += 1
        puts "============================================="
        puts "間違っていた問題番号 => #{mondai_check.number}"
        puts "問題文"
        puts mondai_check.mondai
        puts "答え -> #{mondai_check.kotae}"
        puts "あなたの回答 -> #{mondai_check.answer}"
        puts "============================================="
      end
    end
    puts "正答数：#{yes_cnt}"
    puts "誤回答数：#{no_cnt}"
  end

        
end

#flagで問題を追加する状態か、テスト中かを判断する
puts "１：問題を追加　２：成績表示　３：テストを始める"
print "操作を選択->"
flag = gets.to_i

#表示専用メソッドを使うための仮インスタンス
printer = Problem_data_in.new
input_data = []

#問題を追加してtest_file.txtとtest_class.txtに挿入する
while(flag == 1)
  print "問題文を入力->"
  mon_input = gets.chomp
  printer.bunya_print
  print "分野の入力->"
  bun_input = gets.chomp
  print "答えの入力->"
  kot_input = gets.chomp
  input_data << Problem_data_in.new(mon_input,bun_input,kot_input)

  puts "問題文を追加しますか？"
  print "追加：１　終了：０->"
  flag = gets.to_i
  
  if flag == 0
    input_data.each do |a|
      a.input
    end
    exit
  end
end

#テスト開始モード
while(flag == 3)
  puts "問題設定"
  print "問題数->"
  mondai_num_max = gets.to_i
  printer.bunya_print
  print "分野指定->"
  bunya = gets.chomp

  test_a = Problem_data_out.new(mondai_num_max,bunya)
  test_a.test_start

  puts "テストを終了しますか？"
  print "再度テスト：3 終了：0  >>"
  flag = gets.to_i
end
