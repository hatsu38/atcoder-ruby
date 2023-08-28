# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 4
# 1 4 6 3
# 出力例
# 5
N = gets.to_i
strs = gets.split.map(&:to_i).map(&:abs).sort

puts strs[-1] - strs[0]
