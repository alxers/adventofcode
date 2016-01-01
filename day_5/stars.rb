class TestWord
  def initialize(word)
    @word = word
  end
end

class TestWord1 < TestWord

  def contains_vowels?
    @word.scan(/[aeoui]/).count >= 3
  end

  def contains_doubles?
    @word.chars.each_with_index { |letter, index| return true if letter == @word[index + 1]  }
    false
  end

  def contains_restricted?
    ['ab', 'cd', 'pq', 'xy'].each { |el| return true if @word.include? el }
    false
  end

  def nice?
    contains_vowels? && contains_doubles? && !contains_restricted?
  end
end

class TestWord2 < TestWord

  def contains_pairs?
    @word.chars.each_with_index do |letter, index|
      first_two = [@word[index], @word[index + 1]]
      rest = @word[(index + 2)..-1]
      return true if rest && rest.include?(first_two.join(''))
    end
    false
  end

  def contains_one_letter_in_between?
    @word.chars.each_with_index { |letter, index| return true if letter == @word[index + 2]  }
    false
  end

  def nice?
    contains_pairs? && contains_one_letter_in_between?
  end
end

class Star1
  def initialize(lines)
    counter = 0
    lines.each do |line|
      counter += 1 if TestWord1.new(line).nice?
    end
    puts counter
  end
end

class Star2
  def initialize(lines)
    counter = 0
    lines.each do |line|
      counter += 1 if TestWord2.new(line).nice?
    end
    puts counter
  end
end
