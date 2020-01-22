### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 3
# output
# 6
N = gets.to_i

puts 2.lcm(N)
