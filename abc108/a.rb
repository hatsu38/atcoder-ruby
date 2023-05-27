# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 11
# output
# 30
k = gets.to_i

even_cnt = k / 2
odd_cnt = k.even? ? even_cnt : even_cnt + 1
puts even_cnt * odd_cnt
