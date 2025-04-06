class Word_class
  attr_writer :word, :x, :y ,:length

  def initialize(word = nil,x = nil,y = nil) #{wordはtxtから持ってきた一つの文字列}{xは最終格納場所の列位置}{yは最終格納場所の行位置}
    @word = word
    @x = x
    @y = y

    #データの有無確認
    if @word == nil || @x = nil || @y = nil
      puts "コードエラー１：Word_classに値が入っていない"
      exit
    end

    @length = 0 #{lengthは文字列の文字数}
    @word.each do
      @length += 1
    end
  end
end


