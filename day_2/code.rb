def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.split("\n")
end

INPUT = parse(file "input.txt").map { |i| i.split(/\W+/) }

# PART ONE

x = 0
y = 0

INPUT.each do |m|
  case m.first
  when "forward"
    x += m.last.to_i
  when "down"
    y += m.last.to_i
  when "up"
    y -= m.last.to_i
  end
end

puts x * y

# PART TWO

x = 0
y = 0
aim = 0

INPUT.each do |m|
  case m.first
  when "forward"
    x += m.last.to_i
    y += aim * m.last.to_i
  when "down"
    aim += m.last.to_i
  when "up"
    aim -= m.last.to_i
  end
end

puts x * y
