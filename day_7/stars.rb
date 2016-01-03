class Star1

  def initialize(lines)
    @hash = {}
    lines.each do |line|
      parse_str(line)
    end

    puts find_result('a')
  end

  def parse_str(line)
    arr = line.split
    output_id = arr.last
    rest = arr[0..-3]

    @hash[output_id] = rest
  end

  def find_result(output)
    if output.match(/\d+/)
      output.to_i
    elsif @hash[output].is_a? Numeric
      @hash[output]
    elsif @hash[output].count == 1
      @hash[output] = find_result(@hash[output].first)
    elsif @hash[output].count == 2
      @hash[output] = ~find_result(@hash[output].last)
    elsif @hash[output][1] == 'AND'
      @hash[output] = find_result(@hash[output][0]) & find_result(@hash[output][2])
    elsif @hash[output][1] == 'OR'
      @hash[output] = find_result(@hash[output][0]) | find_result(@hash[output][2])
    elsif @hash[output][1] == 'LSHIFT'
      @hash[output] = find_result(@hash[output][0]) << find_result(@hash[output][2])
    elsif @hash[output][1] == 'RSHIFT'
      @hash[output] = find_result(@hash[output][0]) >> find_result(@hash[output][2])
    end
  end

end

class Star2 < Star1

  def initialize(lines)
    @hash = {}
    lines.each do |line|
      parse_str(line)
    end
    @hash['b'] = 3176
    puts find_result('a')
  end

end
