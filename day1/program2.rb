INPUT = 'input.txt'

calories = Array.new
elf_count = 0
File.readlines(INPUT).each do |line|
  new_cal = line.to_i
  elf_count += new_cal

  if new_cal == 0
    calories << elf_count
    elf_count = 0
  end
end

pp calories.sort.reverse[0..2]
puts calories.sort.reverse[0..2].sum
