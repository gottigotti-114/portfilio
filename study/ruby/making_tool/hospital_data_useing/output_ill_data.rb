#症状データの出力
class Ill_data
  attr_accessor :ill_name, :ill_out_day

  def initialize(ill_name,ill_out_day)
    @ill_name, @ill_out_day = ill_name, ill_out_day
  end

  #データの出力
  def printer
    puts "#{@ill_name}の退院までの日数\t|#{@ill_out_day}日"
    puts "----------------------------------------------------"
  end
end

#ハッシュ表(連想配列)を使って代入
data = []
ill_data = {}
File.open("ill_data.txt","r") do |file|
  file.each_line do |record|
    data = record.strip.split(',')
    ill_data[data[0]] = data[1]
  end
end
print_data = []
ill_data.each do |key,value|
  print_data << Ill_data.new(key,value)
end

#ハッシュ表の値を使って出力

print_data.each do |record|
  record.printer
end