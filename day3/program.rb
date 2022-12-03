INPUT = ENV['INPUT'] ? ENV['INPUT'] : 'input.txt'
DEBUG = ENV['DEBUG'] ? true : false

def debug_print(stringish)
  pp stringish if DEBUG
end

@score = 0

def score_for(char)
    if ('a'..'z').include? char
      #ord for a is 97
      debug_print 'lower'
      char.ord - 96
    else
      #assume capital - ord of A is 65
      char.ord - 38
  end
end

file_lines = File.readlines(INPUT)
file_lines.each do |line|
  chars = line.chomp.chars
  length = chars.size
  first = chars[0..(length/2 - 1)]
  second = chars[(length/2)..-1]
  char = (first & second)[0]
  raise "WTF #{char}" unless char.length == 1
  debug_print char
  char_score = score_for(char)
  debug_print char_score
  @score += score_for(char)
end

puts @score
