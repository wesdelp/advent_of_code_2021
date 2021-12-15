def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.split("\n").map { |d| d.split(" -> ") }.map { |d| d.map { |p| p.split(",")} }
end

INPUT = parse(file "input.txt")

def point_range(first, second)
  if first > second
    first.downto(second).to_a
  else
    first.upto(second).to_a
  end
end

def calculate_points(input, include_diagonal=false)
  points = []

  input.each do |s|
    x1 = s[0][0].to_i
    x2 = s[1][0].to_i 
    y1 = s[0][1].to_i 
    y2 = s[1][1].to_i 
    
    if x1 == x2
      point_range(y1, y2).each do |y|
        points << [x1, y]
      end
    elsif y1 == y2
      point_range(x1, x2).each do |x|
        points << [x, y1]
      end
    else
      next unless include_diagonal
      x_range = point_range(x1, x2)
      y_range = point_range(y1, y2)

      x_range.zip(y_range).each { |p| points << p }
    end
  end

  points
end

# PART 1

points = calculate_points(INPUT)
counts = points.group_by(&:itself).transform_values(&:size)
p counts.values.count { |x| x > 1 }

# PART 2

points = calculate_points(INPUT, include_diagonal: true)
counts = points.group_by(&:itself).transform_values(&:size)
p counts.values.count { |x| x > 1 }
