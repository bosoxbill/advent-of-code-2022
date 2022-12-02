INPUT = 'input.txt'
DEBUG = false

RPS_CODES = {
  'A' => :rock,
  'B' => :paper,
  'C' => :scissors,
  'X' => :rock,
  'Y' => :paper,
  'Z' => :scissors
}

HAND_SCORES = {
  rock: 1,
  paper: 2,
  scissors: 3
}

RPS_SCORES = {
  [:rock, :scissors] => 6,
  [:scissors, :paper] => 6,
  [:paper, :rock] => 6,
  [:rock, :rock] => 3,
  [:scissors, :scissors] => 3,
  [:paper, :paper] => 3,
  [:scissors, :rock] => 0,
  [:paper, :scissors] => 0,
  [:rock, :paper] => 0
}

round_score = 0
total_score = 0

File.readlines(INPUT).each do |line|
  opponent, me = line.split
  my_hand = RPS_CODES[me]
  opponent_hand = RPS_CODES[opponent]

  puts "I go #{my_hand } vs #{opponent_hand}" if DEBUG

  round_score = RPS_SCORES[[my_hand, opponent_hand]] + HAND_SCORES[my_hand]
  puts "...for #{round_score}" if DEBUG

  total_score += round_score
end

puts total_score
