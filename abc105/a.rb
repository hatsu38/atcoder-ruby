# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 7 3
# 出力例
# 1
N, K = gets.chomp.split.map(&:to_i)
puts (N % K).zero? ? 0 : 1
