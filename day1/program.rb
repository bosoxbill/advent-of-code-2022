INPUT = 'input.txt'

high_calories = 0
calories = 0
File.readlines(INPUT).each do |line|
  new_cal = line.to_i
  calories += new_cal

  if calories > high_calories
    high_calories = calories
  end

  if new_cal == 0
    calories = 0
  end
end

puts high_calories
