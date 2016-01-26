require 'pry'

class Star1

  INPUT = "vzbxkghb"

  def initialize
    p make_pass(INPUT)
  end

  def restricted_chars?(str)
    str.match(/i|o|l/)
  end

  def matching_pairs?(str)
    str.match(/(.)\1\w*(?!\1)(.)\2/)
  end

  def correct_sequence?(str)
    str.chars.each_with_index { |_, i| return true if str[i].next == str[i+1] && str[i+1].next == str[i+2] }
    false
  end

  def valid_pass?(str)
    !restricted_chars?(str) && correct_sequence?(str) && matching_pairs?(str)
  end

  def make_pass(str)
    while !(valid_pass?(str) && str != 'vzbxxyzz')
      str = str.next
    end
    puts str
  end
end

Star1.new
