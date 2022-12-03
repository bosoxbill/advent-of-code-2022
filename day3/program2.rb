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

while file_lines.length > 0
  first, second, third = file_lines.shift(3).map(&:chomp).map(&:chars)
  debug_print first
  debug_print second
  debug_print third
  debug_print ''
  
  char = ((first & second) & (second & third))[0]
  debug_print char

  char_score = score_for(char)
  debug_print char_score
  @score += score_for(char)

end

puts @score
