# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3 2 3
# 出力例
# 5
p, q, r = gets.chomp.split.map(&:to_i)

puts [p + q, q + r, r + p].min
