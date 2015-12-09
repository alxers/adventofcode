File.foreach('input.txt') do |line|
  count = 0
  line.chars.each do |char|
    if /\(/ =~ char
      count += 1
    end

    if /\)/ =~ char
      count -= 1
    end
  end
  puts count
end
