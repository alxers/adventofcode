class Rudolph

  def initialize(day_num)
    @day_num = day_num
    @lines = []
    File.foreach("./day_#{@day_num}/input.txt") do |line|
      @lines << line
    end
  end

  def run
    require "./day_#{@day_num}/stars"
    puts "Rudolph is about to start running"
    Star1.new(@lines)
    Star2.new(@lines)
  end
end

Rudolph.new(6).run
