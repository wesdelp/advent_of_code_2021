def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.strip.split(',').map(&:to_i)
end

input = parse(file "input.txt")

def calculate_fish(fish, days)
  day_hash = (0..8).to_a.to_h { |i| [i, fish.count(i) ] }

  days.times do
    day_hash = day_hash.map { |k,v| [k-1, v] }.to_h

    day_hash[6] = day_hash[6] + day_hash[-1]
    day_hash[8] = day_hash[-1]
    day_hash.delete(-1)
  end

  day_hash.values.sum
end

# PART 1
p calculate_fish(input, 80)

# PART 2
p calculate_fish(input, 256)
