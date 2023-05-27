# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 7
# 6 7 8
# 8 8 3
# 2 5 2
# 7 8 6
# 4 6 8
# 2 3 4
# 7 5 1
# output
# 46
n = gets.to_i
strs = Array.new(n) { gets.chomp.split.map(&:to_i) }

dp = Array.new(n + 10) { Array.new(3, 0) }
n.times do |i|
  3.times do |j|
    3.times do |k|
      next if j == k

      value = dp[i][j] + strs[i][k]
      dp[i + 1][k] = value if dp[i + 1][k] < value
    end
  end
end
puts dp[n].max
