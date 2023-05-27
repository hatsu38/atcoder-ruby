# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 400 1000 400 20
# 10 10
# output
# 6000
a, b, c, k = gets.chomp.split.map(&:to_i)
s, t = gets.chomp.split.map(&:to_i)
ans = (s * a) + (b * t)
ans -= (s + t) * c if s + t >= k
puts ans
