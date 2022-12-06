INPUT = ENV['INPUT'] ? ENV['INPUT'] : 'input.txt'
DEBUG = ENV['DEBUG'] ? true : false

def debug_print(stringish)
  pp stringish if DEBUG
end

data_stream = File.readlines(INPUT).map(&:chomp).first.chars

data_stream.each_with_index do |char, index|
  next if index < 3
  if data_stream[((index - 3)..index)].uniq.length == 4
    puts index + 1
    exit
  end
end
