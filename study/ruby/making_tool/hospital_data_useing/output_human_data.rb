class Hospital_information
  attr_accessor :name, :code, :ill, :in_day, :human_type

  #インストラクタ
  def initialize(name,hurigana,code,ill,in_day,human_type)
    @name, @hurigana, @code, @ill, @in_day, @human_type = name, hurigana, code.to_i, ill, in_day.to_i, human_type
    #病名ごとの予想入院日数(連想配列で)
    @ill_outDay = {
      "風邪" => 3,
      "インフルエンザウイルス感染症" => 12,
      "コロナウイルス感染症" => 18,
      "花粉症" => 100,
      "生理遅延" => 30,
      "狭心症" => 60,
      "ハンセン病" => 20,
      "黒死病" => "-",
      "白血病" => "-",
      "胃潰瘍" => 50,
      "骨折" => 30,
      "全身火傷" => 200,
      "記憶喪失" => "-",
      "子宮内膜症" => 10,
      "ノロウイルス感染症" => 40,
      "尿路結石" => 20,
      "癌" => "-",
      "肺炎" => 30,
      "歯矯正" => 5,
      "貧血" => 3,
      "のどの痛み" => 1,
      "内蔵損傷" => "-",
      "発熱" => 4,
      "嘔吐" => 2,
      "脱臼" => 5,
      "骨粗鬆症" => 30,
      "心臓発作" => "-",
      "精神疾患" => 30,
      "高血圧" => 14,
      "エボラウイルス感染症" => 40,
      "感染症" => "-"
      
    }
  end

  #退院予定日を出力するメソッド
  def out_day
    #もしも病名が当てはまらなかった場合の予定日の出力の仕方
    @out_day = @ill_outDay["#{@ill}"]
    if @out_day == nil
      @out_day = "-"
    end
    #不明だった場合の処理
    if @out_day == "-"
      @out_day = "不明"
      date_text = ""
    else
      date_text = "日後"
    end
    puts "<<#{@name}さんの退院予定日：#{@out_day}#{date_text}>>"
    puts

  end

  #患者データを出力するメソッド
  def display_date
    #入院日のエラーチェック
    if((@in_day/100)%100 > 12)
      @in_day_date = "月入力データエラー"
    elsif((@in_day%100) > 31)
      @in_day_date = "日入力データエラー"
    else
      @in_day_date = "#{@in_day/10000}/#{(@in_day/100)%100}/#{@in_day%100}"
    end

    #血液型のエラーチェック
    case @human_type
    when "A","B","O","AB"
      @human_type = "#{@human_type}型"
    else
      @human_type = "血液型入力エラー"
    end

    #出力用患者データをセットする
    @date = <<-END
--------------------------
患者名：#{@name}
フリガナ：#{@hurigana}
患者番号：#{@code}
発症した病気：#{@ill}
入院日：#{@in_day_date}
血液型：#{@human_type}
--------------------------
END
    puts @date
  end
end

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

#human_date.txtのデータ獲得
human_hairetsu = []
File.open("human_date.txt","r") do |file|
  file.each_line do |record|
    human_hairetsu << record.split(',')
  end
end

#インスタンス配列の宣言
human = []
human_hairetsu.each do |record|
  human << Hospital_information.new(record[0],record[1],record[2],record[3],record[4],record[5])
end

#オブジェクトデータの出力と、退院日を出力
i = 0
human.each do
  if(i <= 1)
    i += 1
    next
  end
  human[i].display_date
  human[i].out_day
  i += 1
end