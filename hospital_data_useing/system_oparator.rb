require 'tk'

root = TkRoot.new{title 'ツールの選択'}

label = TkLabel.new(root) do
  text '患者データを追加する'
  pack { padx 50; pady 30; side 'left'}
end

#患者データを追加するボタン
button = TkButton.new(root) do
  text '追加'
  command{
    system("ruby input_human_data.rb")
    Tk.exit
  }
  pack { padx 100; pady 30; side 'right'}
end

label = TkLabel.new(root) do
  text '患者データの表示'
  pack {padx 50; pady 30; side 'left'}
end

#患者データを表示するボタン
button = TkButton.new(root) do
  text '表示'
  command{
    system("ruby output_human_data.rb")
    Tk.exit
  }
  pack{ padx 100; pady 30; side 'right'}
end

lebal = TkLabel.new(root) do
  text '症状と退院までの日数表示'
  pack{ padx 50; pady 30; side 'left'}
end

#症状と退院までの日数を表示するボタン
button = TkButton.new(root) do
  text '表示'
  command {
    system("ruby output_ill_data.rb")
    Tk.exit
  }
  pack{ padx 100; pady 30; side 'right'}
end

Tk.mainloop