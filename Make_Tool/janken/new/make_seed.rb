day_now = Time.now.to_f #現在時刻を取得
seed_file_num = 0
begin

  #seed_file.txtの前回生成した乱数を読み取り
  File.open("seed_file.txt","r") do |num|
    seed_file_num = num.read.to_i
    if seed_file_num <= 0 # ->>もしも取得したファイル取得シードが0以下だった場合、１を入れる
      seed_file_num = 1
    end
  end
rescue Errno::ENOENT # ->>もしもファイルが存在しなかった場合、ファイル取得シードに１を入れる
  seed_file_num = 1
end

seed = day_now * seed_file_num #現在時刻 x ファイル取得シード = 新たなシード値
seed = seed % 100000000 #オーバーフロー防止のために桁を絞っておく
File.open("seed_file.txt","w") do |file|
  file.puts seed.to_i
end
