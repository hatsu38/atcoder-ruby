### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 1000000000000000000 1
# output
# 0

n, k = gets.chomp.split(' ').map(&:to_i)

n %= k
puts [n,k-n].min
