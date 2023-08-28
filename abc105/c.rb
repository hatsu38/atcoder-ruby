# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 123456789
# 出力例
# 11000101011001101110100010101

n = gets.to_i
# nが奇数のとき、s0 = 1
ans = []
loop do
  if n.odd?
    ans.unshift(1)
    n -= 1
  else
    ans.unshift(0)
  end
  break if [0, 1].include?(n) # rubocop:disable Performance/CollectionLiteralInLoop

  n /= -2
end
puts ans.join
