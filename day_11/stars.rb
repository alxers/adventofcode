require 'pry'

class Star1

  INPUT = "abcdefgh"

  def initialize
    p make_password(INPUT)
  end

  def inc_letter(str)
    str.chars.map do |letter|
      next_letter = letter.next
      if next_letter.length > 1
        next_letter[0]
      else
        next_letter
      end
    end.join
  end

  def restricted_chars?(str)
    str.match(/i|o|l/)
  end

  def matching_pairs?(str)
    str.match(/(.)\1\w*(?!\1)(.)\2/)
  end

  def make_password(str)
    if restricted_chars?(str) && matching_pairs?(str)
      str
    else
      make_password(inc_letter(str))
    end
  end
end

Star1.new
