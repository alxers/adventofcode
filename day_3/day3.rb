require 'pry-byebug'

def get_directions
  directions = []
  File.foreach('input.txt') do |line|
    directions = line.chars
  end
  directions
end

def unique_visits(directions)
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
  puts result.uniq.size
end

unique_visits(get_directions)
