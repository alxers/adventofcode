class Star1

  def initialize(lines)
    result = 0
    lines.each do |line|
      result += code_chars(line) - in_memory_chars(line)
    end
    puts result
  end

  def in_memory_chars(line)
    eval(line).length
  end

  def code_chars(line)
    line.strip.length
  end

end

class Star2 < Star1

  def initialize(lines)
    result = 0
    lines.each do |line|
      result += extended_code_chars(line) - code_chars(line)
    end
    puts result
  end

  def extended_code_chars(line)
    line.strip.inspect.length
  end
end
