### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 5 4
# output
# Yay!
a,b = gets.chomp.split(" ").map(&:to_i)

if a <= 8 && b <= 8
  puts 'Yay!'
else
  puts ':('
end
