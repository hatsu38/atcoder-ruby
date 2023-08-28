# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 10 4
# 出力例
# 3
h, a = gets.chomp.split.map(&:to_i)
ans = 0
while h.positive?
  ans += 1
  h -= a
end
puts ans
