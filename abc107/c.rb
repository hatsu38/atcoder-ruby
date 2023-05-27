# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# strs = N.times.map{ gets.chomp.split('') }

# input
# 8 5
# -9 -7 -4 -3 1 2 3 4
# output
# 10

n, k = gets.chomp.to_s.split.map(&:to_i)
strs = gets.chomp.to_s.split.map(&:to_i)
# N本のうち連続するK本のろうそくを選ぶ方法はN-K+1通り
ans = 10 * 10
(n - k + 1).times do |i|
  r = strs[i + k - 1]
  l = strs[i]
  r_dist = (r - l).abs + r.abs
  l_dist = (l - r).abs + l.abs
  ans = [r_dist, l_dist, ans].min
end
puts ans
