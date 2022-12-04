INPUT = ENV['INPUT'] ? ENV['INPUT'] : 'input.txt'
DEBUG = ENV['DEBUG'] ? true : false

def debug_print(stringish)
  pp stringish if DEBUG
end

def overlaps(r1, r2)
  r2.include?(r1.first) || r2.include?(r1.last) ||
    r1.include?(r2.first) || r1.include?(r2.last)
end

@count = 0

file_lines = File.readlines(INPUT)
file_lines.each do |line|
  first, second = line.chomp.split(',').map{|rs| rs.split('-').map(&:to_i)}
  first_range = first[0]..first[1]
  second_range = second[0]..second[1]
  @count += 1 if overlaps(first_range, second_range)
end

puts @count
