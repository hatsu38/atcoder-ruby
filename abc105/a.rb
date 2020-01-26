### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 7 3
# output
# 1
N, K = gets.chomp.split(" ").map(&:to_i)
puts N % K == 0 ? 0 : 1
