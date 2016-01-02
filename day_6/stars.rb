class Star1

  def initialize(lines)
    @grid = Array.new(1000) { Array.new(1000, 0) }
    lines.each do |line|
      switch(line)
    end
    puts @grid.map {|a| a.inject(:+)}.inject(:+)
  end

  def get_coord(line)
    @x1, @y1, @x2, @y2 = line.scan(/\d+/).map(&:to_i)
  end

  def get_action(line)
    @action = line.scan(/off|on/).first
  end

  def switch(line)
    get_coord(line)
    get_action(line)

    @x1.upto(@x2) do |x|
      @y1.upto(@y2) do |y|
        case @action
        when 'off'
          @grid[x][y] = 0
        when 'on'
          @grid[x][y] = 1
        else
          @grid[x][y] = 1 - @grid[x][y]
        end
      end
    end
  end

end

class Star2 < Star1

  def switch(line)
    get_coord(line)
    get_action(line)

    @x1.upto(@x2) do |x|
      @y1.upto(@y2) do |y|
        case @action
        when 'off'
          @grid[x][y] -= 1
          @grid[x][y] = 0 if @grid[x][y] < 0
        when 'on'
          @grid[x][y] += 1
        else
          @grid[x][y] += 2
        end
      end
    end
  end

end
