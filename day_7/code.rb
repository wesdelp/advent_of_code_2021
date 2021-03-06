def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.strip.split(',').map(&:to_i)
end

input = parse(file "input.txt")

max = input.max
min = input.min

# PART 1

fuel_log = {}

(min..max).to_a.each do |position|
  total_fuel = 0
  input.each do |crab|
    total_fuel += (crab - position).abs
  end
  fuel_log[position] = total_fuel
end

p fuel_log.sort_by {|_key, value| value}.first.last

# PART 2

fuel_log = {}

(min..max).to_a.each do |position|
  total_fuel = 0
  input.each do |crab|
    distance = (crab - position).abs
    # Triangle numbers
    total_fuel += distance * (((distance - 1)/2.0) + 1)
  end
  fuel_log[position] = total_fuel.to_i
end

p fuel_log.sort_by {|_key, value| value}.first.last
