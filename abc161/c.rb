# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 1000000000000000000 1
# 出力例
# 0

n, k = gets.chomp.split.map(&:to_i)

n %= k
puts [n, k - n].min
