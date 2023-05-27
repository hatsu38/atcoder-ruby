# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 6
# 30 10 60 10 60 50
# output
# 40
n = gets.to_i
strs = gets.chomp.split.map(&:to_i)

# dp = [0, (strs[0]-strs[1]).abs]
# [*2..(n-1)].each do |i|
#   dp << [dp[i-2] + (strs[i-2]-strs[i]).abs, dp[i-1] + (strs[i-1]-strs[i]).abs].min
# end
# puts dp[-1]

dp = Array.new(n, 0)
dp[0] = 0
dp[1] = (strs[1] - strs[0]).abs

[*2..(n - 1)].each do |i|
  pre_a = dp[i - 1] + (strs[i] - strs[i - 1]).abs
  pre_b = dp[i - 2] + (strs[i] - strs[i - 2]).abs
  dp[i] = [pre_a, pre_b].min
end

puts dp[n - 1]
