### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 998244353 99824435
# output
# 549034394
a, b = gets.chomp.split(' ').map(&:to_i)

num = a + b
puts num.even? ? (a + b) / 2 : 'IMPOSSIBLE'
