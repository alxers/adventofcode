require 'pry'

class Star1

  def initialize(lines)
    distances = []
    all_cities = []
    all_routes = {}
    lines.each do |line|
      city1, city2, dist = parse(line)

      all_cities << [city1, city2]
      all_routes[[city1, city2]] = dist.to_i
      all_routes[[city2, city1]] = dist.to_i
    end
    puts dist_sum(all_cities, all_routes).min
  end

  def dist_sum(all_cities, all_routes)
    sums = []
    permuted_cities = city_permutation(all_cities.flatten.uniq)
    permuted_cities.each do |cities|
      curr = 0
      0.upto(cities.count-2) do |i|
        curr += all_routes[[cities[i], cities[i+1]]]
      end
      sums << curr
    end
    sums
  end

  def get_distances(line)
    line.split.last.to_i
  end

  def parse(line)
    # city1, city2, dist
    line.split.reject! {|item| item =~ /to|=/i }
  end

  def city_permutation(cities)
    cities.permutation.to_a
  end

  def get_shortest(distances)
    distances.map {|arr| arr.inject(:+) }.min
  end

end


class Star2 < Star1
  def initialize(lines)
    distances = []
    all_cities = []
    all_routes = {}
    lines.each do |line|
      city1, city2, dist = parse(line)

      all_cities << [city1, city2]
      all_routes[[city1, city2]] = dist.to_i
      all_routes[[city2, city1]] = dist.to_i
    end
    puts dist_sum(all_cities, all_routes).max
  end
end
