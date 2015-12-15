require 'pry-byebug'

def amount_of_paper(l, w, h)
  lw, wh, hl = l * w, w * h, h * l
  2 * (lw + wh + hl) + [lw, wh, hl].min
end

def min_ribbon_dimensions(l, w, h)
  arr = [l, w, h]
  arr.delete(arr.max)
  arr.inject { |i, j| i * 2 + j * 2 }
end

@sum_of_all = 0

File.foreach('input.txt') do |line|

  dimensions = line.split('x')
  l, w, h = dimensions.collect(&:to_i)

  @sum_of_all += amount_of_paper(l, w, h)
end

puts @sum_of_all
