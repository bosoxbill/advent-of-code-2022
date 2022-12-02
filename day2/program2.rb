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

WINNER_FOR = {
  rock: :paper,
  paper: :scissors,
  scissors: :rock
}

LOSER_FOR = WINNER_FOR.inject(Hash.new){|h, (k, v)| h[v] = k; h }

TIE_FOR = WINNER_FOR.inject(Hash.new){|h, (k, _v)| h[k] = k; h }

REQUIRED_RESULT = {
  'X' => LOSER_FOR,
  'Y' => TIE_FOR,
  'Z' => WINNER_FOR
}

round_score = 0
total_score = 0

File.readlines(INPUT).each do |line|
  opponent, goal = line.split
  opponent_hand = RPS_CODES[opponent]

  my_hand = REQUIRED_RESULT[goal][opponent_hand]

  puts "Opponent goes #{opponent_hand}}I go #{my_hand } vs #{opponent_hand}" if DEBUG

  round_score = RPS_SCORES[[my_hand, opponent_hand]] + HAND_SCORES[my_hand]
  puts "...for #{round_score}" if DEBUG

  total_score += round_score
end

puts total_score
