def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.split("\s").map(&:to_i)
end

INPUT = parse(file "input.txt")

# PART 1

increase = 0

INPUT.each_cons(2) do |m|
  increase += 1 if m.first < m.last
end

puts increase

# PART 2

increase = 0

INPUT.each_cons(3).each_cons(2) do |a, b|
  increase += 1 if a.sum < b.sum
end

puts increase
