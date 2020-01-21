### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# problem b
# input
# 4 3
# output
# 3333
a,b = gets.chomp.split(' ').map(&:to_i)
puts [b.to_s * a, a.to_s * b].sort.first
