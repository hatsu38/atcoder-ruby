# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 777
# output
# Yes

strs = gets.chomp
puts strs.include?('7') ? 'Yes' : 'No'
