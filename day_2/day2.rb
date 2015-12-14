def square_dimensions(first, second)
  2 * first * second
end

@sum_of_all = 0

File.foreach('input.txt') do |line|

  dimensions = line.gsub(/\D/, '').chars
  min = dimensions.min
  l, w, h = dimensions.collect(&:to_i)

  sum = square_dimensions(l, w) + square_dimensions(w, h) + square_dimensions(h, l)
  @sum_of_all += sum
end

puts @sum_of_all
