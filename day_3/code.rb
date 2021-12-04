def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.split("\n")
end

INPUT = parse(file "input.txt").map do |b|
  b.split('/n')[0].split('').map(&:to_i)
end

# PART 1

gamma = INPUT.transpose.map(&:sum).map do |b|
  b > INPUT.length / 2 && 1 || 0
end.join.to_i(2)

epsilon = INPUT.transpose.map(&:sum).map do |b|
  b < INPUT.length / 2 && 1 || 0
end.join.to_i(2)

p gamma * epsilon

# PART 2

BIT_LENGTH = INPUT.first.length
OXYGEN_GENERATOR = 'oxygen_generator'.freeze
CO2_SCRUBBER = 'co2_scrubber'.freeze

def calculate_rating(type, input, index=0)
  return unless input.any? || position > BIT_LENGTH - 1
  return input.join.to_i(2) if input.length == 1

  t = input.transpose.map(&:sum).map do |b|
    if type == OXYGEN_GENERATOR
      b >= input.length / 2.0 && 1 || 0
    elsif type == CO2_SCRUBBER
      b < input.length / 2.0 && 1 || 0
    end
  end

  next_input = input.select { |i| i[index] == t[index] }
  calculate_rating(type, next_input, index + 1)
end

oxygen_generator_rating = calculate_rating(OXYGEN_GENERATOR, INPUT)
co2_scrubber_rating = calculate_rating(CO2_SCRUBBER, INPUT)

p oxygen_generator_rating * co2_scrubber_rating
