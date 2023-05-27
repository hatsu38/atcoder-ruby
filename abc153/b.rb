# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 211 5
# 31 41 59 26 53
# output
# No
h, = gets.chomp.split.map(&:to_i)
strs = gets.chomp.split.map(&:to_i).sort
puts strs.sum >= h ? 'Yes' : 'No'
