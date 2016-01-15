require 'json'

class Star1
  def initialize(lines)
    p lines.to_s.scan(/-*\d+/).map(&:to_i).inject(:+)
  end
end

class Star2
  def initialize(lines)
    @sum = 0
    sum(JSON.parse(lines[0]))
    puts @sum
  end

  def sum(val)
    if val.is_a? Numeric
      @sum += val
    elsif val.is_a? Array
      val.each {|el| sum(el) }
    elsif val.is_a? Hash
      if !val.values.include? 'red'
        val.each {|k, v| sum(k); sum(v) }
      end
    end
  end
end
