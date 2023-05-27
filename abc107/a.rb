# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 15 11
# output
# 5
n, i = gets.chomp.split.map(&:to_i)

puts n + 1 - i
