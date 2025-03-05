class Calc
  def initialize(num1,num2)
    @num1, @num2 = num1, num2
  end

  def sum
    @num1 + @num2
  end

  def max
    if @num1 - @num2
      return @num1
    else
      return @num2
    end
  end

  def min
    if @num1 - @num2
      return @num2
    else
      return @num1
    end
  end

  def add
    @num1 + @num2
  end

  def subtra
    @num1 - @num2
  end

  def multi
    @num1 * @num2
  end

  def division
    ans = @num1 / @num2
    amari = @num1 % @num2

    return "#{ans}...#{amari}"
  end

  def print
    puts "--------------------"
    puts "引数１：#{@num1}"
    puts "引数２：#{@num2}"
    puts "和：#{add}"
    puts "差：#{subtra}"
    puts "積：#{multi}"
    puts "商：#{division}"
    puts "最大値：#{max}"
    puts "最小値：#{min}"
  end

end

calc1 = Calc.new(1,2)
calc2 = Calc.new(3,5)
calc3 = Calc.new(7,4)

calc1.print
calc2.print
calc3.print