### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 100
# output
# 3
n = gets.to_i
puts n.odd? ? (n+1)/2 : n/2
