require 'pry'

class Star1

  TOTAL_TIME = 2503

  def initialize(lines)
    results = []
    lines.each do |line|
      deer_data = line.split
      results << calculate_distance(deer_data)
    end
    p results
  end

  def calculate_distance(deer_data)
    total_time = TOTAL_TIME
    deer = parse(deer_data)
    dist = 0

    running = true

    while total_time >= 0
      if running
        if total_time >= deer[:run_time]
          deer[:run_time].times { dist += deer[:speed] }
        else
          total_time.times { dist += deer[:speed] }
        end
        total_time -= deer[:run_time]
        running = false
      else
        total_time -= deer[:cooldown]
        running = true
      end
    end
    dist
  end

  def parse(deer_data)
    {
      name: deer_data[0],
      speed: deer_data[3].to_i,
      run_time: deer_data[6].to_i,
      cooldown: deer_data[-2].to_i,
      points: 0
    }
  end
end

class Star2 < Star1
  TOTAL_TIME = 2503

  def initialize(lines)
    deers = []
    lines.each do |line|
      deer_data = line.split
      deers << parse(deer_data)
    end
    winner = calculate_points(deers)
    p winner
  end

  def calculate_points(deers)
    deers
    1.upto(TOTAL_TIME) do |sec|
      deers.each do |deer|
        deer[:dist] = calculate_distance(deer, sec)
      end
      max_dist = deers.map { |deer| deer[:dist] }.max
      deers.each {|deer|  deer[:points] += 1 if deer[:dist] == max_dist }
    end
    deers.map { |deer| deer[:points] }.max
  end

  def calculate_distance(deer, second)
    dist = 0
    running = true

    while second >= 0
      if running
        if second >= deer[:run_time]
          deer[:run_time].times { dist += deer[:speed] }
        else
          second.times { dist += deer[:speed] }
        end
        second -= deer[:run_time]
        running = false
      else
        second -= deer[:cooldown]
        running = true
      end
    end
    dist
  end

end
