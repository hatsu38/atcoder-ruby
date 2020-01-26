### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3
# 3 4 6
# output
# 10

N, G = gets.chomp.split(" ").map(&:to_i)
strs = N.times.map{gets.split.map(&:to_i)}




