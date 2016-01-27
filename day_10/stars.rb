class Star1
  def initialize(input)
    50.times do
      input = input.gsub(/(\d)\1*/) { |a| "#{a.size}#{a[0]}" }
    end
    p input.length
  end
end
INPUT = '1113222113'

Star1.new(INPUT)
