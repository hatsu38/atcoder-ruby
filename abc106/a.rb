# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5 7
# output
# 24
a, b = gets.chomp.split.map(&:to_i)

puts (a - 1) * (b - 1)
