require 'pry'
require 'set'

class Star1

  def initialize(lines)
    all_names = Set.new
    all_arrangements = {}
    lines.each do |line|
      name1, name2, action, happiness = parse(line)

      all_names << name1
      all_names << name2
      if all_arrangements.has_key? [name1, name2].sort
        all_arrangements[[name1, name2].sort] += get_happiness(action, happiness)
      else
        all_arrangements[[name1, name2].sort] = get_happiness(action, happiness)
      end
    end
    #puts dist_sum(all_cities, all_routes).min
    puts arrangements_sum(all_names, all_arrangements).max
  end

  def get_happiness(action, happiness)
    if action == "lose"
      -happiness
    else
      happiness
    end
  end

  def arrangements_sum(all_names, all_arrangements)
    sums = []
    permuted_names = name_permutation(all_names)
    permuted_names.each do |names|
      names.push(names.first)
      curr = 0
      0.upto(names.count-2) do |i|
        curr += all_arrangements[[names[i], names[i+1]].sort]
      end
      sums << curr
    end
    sums
  end

  def parse(line)
    arr = line.split
    name1 = arr.first
    name2 = arr.last.delete('.')
    action = arr[2]
    happiness = arr[3].to_i
    [name1, name2, action, happiness]
  end

  def name_permutation(names)
    names.to_a.permutation.to_a
  end

end


class Star2 < Star1

  def initialize(lines)
    all_names = Set.new
    all_arrangements = {}
    all_names << 'rudolph'

    lines.each do |line|
      name1, name2, action, happiness = parse(line)

      all_names << name1
      all_names << name2
      all_arrangements[['rudolph', name1].sort] = 0
      all_arrangements[['rudolph', name2].sort] = 0
      if all_arrangements.has_key? [name1, name2].sort
        all_arrangements[[name1, name2].sort] += get_happiness(action, happiness)
      else
        all_arrangements[[name1, name2].sort] = get_happiness(action, happiness)
      end
    end
    #puts dist_sum(all_cities, all_routes).min
    puts arrangements_sum(all_names, all_arrangements).max
  end

end
