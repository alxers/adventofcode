require 'pry-byebug'

def amount_of_paper(l, w, h)
  lw, wh, hl = l * w, w * h, h * l
  2 * (lw + wh + hl) + [lw, wh, hl].min
end

def min_ribbon_dimensions(l, w, h)
  arr = [l, w, h]
  arr.delete_at(arr.index(arr.max))
  arr.reduce { |i, j| 2 * (i + j) }
end

def ribbon_for_bow(l, w, h)
  l * w * h
end

def calc_sizes
  sum_of_all_paper = 0
  amount_of_ribbon = 0

  File.foreach('input.txt') do |line|

    dimensions = line.split('x')
    l, w, h = dimensions.collect(&:to_i)

    amount_of_ribbon += min_ribbon_dimensions(l, w, h) + ribbon_for_bow(l, w, h)
    sum_of_all_paper += amount_of_paper(l, w, h)
  end
  puts sum_of_all_paper
  puts amount_of_ribbon
end

calc_sizes
