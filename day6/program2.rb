INPUT = ENV['INPUT'] ? ENV['INPUT'] : 'input.txt'
DEBUG = ENV['DEBUG'] ? true : false

def debug_print(stringish)
  pp stringish if DEBUG
end

data_stream = File.readlines(INPUT).map(&:chomp).first.chars

UNIQUE_COUNT = 13 
data_stream.each_with_index do |char, index|
  next if index < UNIQUE_COUNT
  if data_stream[((index - UNIQUE_COUNT)..index)].uniq.length == UNIQUE_COUNT + 1
    puts index + 1
    exit
  end
end
