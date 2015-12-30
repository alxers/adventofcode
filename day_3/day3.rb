require 'pry-byebug'

FIRST_HOUSE = 1

def get_directions
  directions = []
  File.foreach('input.txt') do |line|
    directions = line.chars
  end
  directions
end

def uniq_visits(directions)
  result = []
  x = 0
  y = 0

  directions.each do |direction|
    case direction
      when "^"
        y += 1
      when ">"
        x += 1
      when "<"
        x -= 1
      when "v"
        y -= 1
    end
    result.push("#{x} | #{y}")
  end
  #puts result.uniq.size + FIRST_HOUSE
  result
end

def uniq_visits_2(input)
  even = []
  odd = []
  input.each_with_index{ |n, i| if i.even? then even.push(n) else odd.push(n) end }
  super_result = uniq_visits(even) + uniq_visits(odd)
  puts super_result.uniq.size + FIRST_HOUSE
end

#unique_visits(get_directions)
uniq_visits_2(get_directions)
