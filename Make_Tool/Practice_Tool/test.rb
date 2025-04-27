a = ["a"]

File.open("test01.txt","r") do |file|
  file.each_line do |record|
    a << record.strip.split(',')
  end
end

a.each do |text|
  p a
  puts text.first
end

######################################

a = []

File.open("test01.txt","r") do |file|
  file.each_line do |record|
    a << record.strip.split(',')
  end
end

a.each do |text|

  p a
  puts text.first
end
