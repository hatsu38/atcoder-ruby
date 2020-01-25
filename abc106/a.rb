### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 5 7
# output
# 24
a,b = gets.chomp.split(" ").map(&:to_i)

puts (a-1)*(b-1)
