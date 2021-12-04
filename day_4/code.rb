def file(path)
  File.read(File.join(__dir__, path))
end

def parse(data)
  data.split(/\n{2,}/)
end

INPUT = parse(file "input.txt")

drawn = INPUT.shift.split(',')
boards = []

INPUT.each do |board|
  boards << board.split("\n").map(&:split)
end

# PART 1

def bingo?(board)
  board.map(&:compact).select { |r| r.empty? }.any? ||
    board.transpose.map(&:compact).select { |r| r.empty? }.any?
end

def calculate_score(board, draw)
  board.flatten.compact.map(&:to_i).sum * draw.to_i
end

def play_to_win(drawn, boards)
  drawn.each do |draw|
    boards.each do |b|
      b.each do |row|
        row.map! { |i| i == draw ? nil : i }
      end

      return calculate_score(b, draw) if bingo?(b)
    end
  end
end

p play_to_win(drawn, boards)

# PART 2

boards = []

INPUT.each do |board|
  boards << board.split("\n").map(&:split)
end

def play_to_lose(drawn, boards)
  finished_boards = []

  drawn.each do |draw|
    boards.each_with_index do |b, index|
      b.map do |row|
        row.map! { |i| i == draw ? nil : i }
      end

      finished_boards |= [index] if bingo?(b)
      return calculate_score(b, draw) if finished_boards.count == boards.count
    end
  end
end

p play_to_lose(drawn, boards)
