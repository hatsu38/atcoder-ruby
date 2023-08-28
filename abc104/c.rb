# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3
# 3 4 6
# 出力例
# 10

N, G = gets.chomp.split.map(&:to_i)
Array.new(N) { gets.split.map(&:to_i) }
