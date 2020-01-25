### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 7 3
# output
# 1
N, K = gets.chomp.split(" ").map(&:to_i)
puts N % K == 0 ? 0 : 1
