INPUT = ENV['INPUT'] ? ENV['INPUT'] : 'input.txt'
DEBUG = ENV['DEBUG'] ? true : false

def debug_print(stringish)
  pp stringish if DEBUG
end

def overlaps(r1, r2)
  r2.include?(r1.first) || r2.include?(r1.last) ||
    r1.include?(r2.first) || r1.include?(r2.last)
end

@towers = Array.new

file_lines = File.readlines(INPUT).map(&:chomp)
blank_line_idx = file_lines.find_index('')
first_chunk_range = (0..(blank_line_idx - 1))
last_chunk_range = ((blank_line_idx + 1)..-1)
initial_setup, moves = file_lines[first_chunk_range].reverse, file_lines[last_chunk_range]

stack_list = initial_setup.shift

stack_list.scan(/\d/).each do |match|
  tower = Array.new
  column = stack_list.chars.find_index(match)
  initial_setup.each_with_index do |stack_layer|
    char = stack_layer[column]
    unless char == ' ' 
      tower << stack_layer[column]
    end
  end
  @towers << tower
end

debug_print @towers
debug_print "^^^START"

# move 10 from 7 to 3
MOVE_REGEX = /^move (?<amount>\d+) from (?<from>\d+) to (?<to>\d+)/

moves.each do |move_string|
  match_data = move_string.match(MOVE_REGEX)
  pp match_data
  to_be_moved = @towers[match_data[:from].to_i - 1].pop(match_data[:amount].to_i)
  debug_print "Moving #{to_be_moved}"
  @towers[match_data[:to].to_i - 1].push(*to_be_moved)
  pp @towers
end

pp @towers.map{|t| t.last}.join('')

