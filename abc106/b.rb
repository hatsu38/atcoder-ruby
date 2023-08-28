# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 105
# 出力例
# 1
require 'prime'
n = gets.to_i
ans = 0
n -= 1 if n.even?
while n >= 1
  ans += 1 if Prime.prime_division(n).map(&:last).map { |num| num + 1 }.inject(&:*) == 8
  n -= 2
end
puts ans
