### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 105
# output
# 1
require 'prime'
n = gets.to_i
ans = 0
n -= 1 if n.even?
while n >= 1 do
  ans += 1 if Prime.prime_division(n).map(&:last).map{|num| num += 1}.inject(&:*) == 8
  n -= 2
end
puts ans
