data = []
ill_data = []
ill_data_h = {}
File.open("ill_data.txt","r") do |file|
  file.each_line do |record|
    data = record.strip.split(',')
    ill_data << {data[0]  => data[1]}
  end
end

ill_data.each do |hash|
  hash.each do |key,value|
    ill_data_h[key] = value
  end
end

puts ill_data_h["骨折"]

