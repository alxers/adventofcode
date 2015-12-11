def position(floor, index)
  if floor == -1
    puts index + 1
  end
end

File.foreach('input.txt') do |line|
  floor = 0
  line.chars.each_with_index do |char, i|
    if /\(/ =~ char
      floor += 1
    end

    if /\)/ =~ char
      floor -= 1
    end

    position(floor, i)
  end
  puts floor
end

