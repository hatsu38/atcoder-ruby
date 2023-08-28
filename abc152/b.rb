# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem b
# 入力例
# 4 3
# 出力例
# 3333
a, b = gets.chomp.split.map(&:to_i)
puts [b.to_s * a, a.to_s * b].min
