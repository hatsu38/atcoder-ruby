# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 13 3
# output
# 81

n, m = gets.chomp.split.map(&:to_i)

ans = ((n * (n - 1)) / 2) + ((m * (m - 1)) / 2)
puts ans
