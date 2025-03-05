class Hospital_date_add
  attr_accessor :name, :hurigana, :ill, :in_day, :human_type

  #データを追加
  def add_date

        #もしhuman_date.txtがなかった場合の対処
    if !(File.exist?("human_date.txt"))
      File.open("human_date.txt","w") do |file|
        human_date_init = <<-END
| 患者名 | フリガナ | 患者番号 | 病名 | 入院日 | 血液型 |,
--------------コンマ区切りで入力すること----------------,
END
        file.puts human_date_init
      end
    end

    File.open("human_date.txt","a") do |file|
      #患者番号の生成
      record = []
      cnt = 0
      File.open("human_date.txt","r") do |file|
        file.each_line do |record_input|
          record << record_input.split(',')
        end
        i = 0
        while record[i] != nil
          i += 1
        end
        cnt = i
      end
      code = cnt-1

      #データをインプット
      file.puts "#{@name},#{@hurigana},#{code},#{@ill},#{@in_day},#{@human_type},"
    end
  end

  #データのフォーマット確認
  def problem_finder

    #未入力かどうかチェック
    if(@name == "")
      puts "原因：名前の入力をしていない"
      judge = 1
    end
    if(@hurigana == "")
      puts "原因：フリガナの入力をしていない"
      judge = 1
    end
    if(@ill == "")
      puts "原因：病名を入力していない"
      judge = 1
    end
    if(@in_day == "")
      puts "原因：日付を入力していない"
      judge = 1
    end
    if(@human_type == "")
      puts "原因：血液型を入力していない"
      judge = 1
    end
  
    #フリガナのチェック
    hurigana_judge = 0
    @hurigana.each_char do |char_text|
      if !(char_text >= "ア" && char_text <= "ン")
        hurigana_judge = 1
      end
    end
    if hurigana_judge == 1
      puts "原因：フリガナが間違っている"
      judge = 1
    end

    #血液型のチェック
    case @human_type
    when "A","B","O","AB"
    else
      puts "原因：血液型が間違っています"
    end

    #もしもジャッジが1(誤判定)だったときの処理
    if judge == 1
      return 1
    else
      return 0
    end
  end
end

#データの入力
human_date = Hospital_date_add.new
puts "患者データを追加します"
print "患者名>>"
human_date.name = gets.chomp
print "フリガナ>>"
human_date.hurigana = gets.chomp
print "病名>>"
human_date.ill = gets.chomp
print "入院日>>"
human_date.in_day = gets.to_i
print "血液型>>"
human_date.human_type = gets.chomp

#データの記述の真偽
if(human_date.problem_finder == 1)
  puts "データ記述に問題があります"
else  
  human_date.add_date
end