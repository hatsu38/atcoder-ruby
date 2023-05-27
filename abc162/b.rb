# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 1000000
# output
# 266666333332

n = gets.to_i

puts (0..n).to_a.select { |num| (num % 3 != 0 && num % 5 != 0) }.sum
