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
strs = gets.chomp.split(' ').map(&:to_i)

dp = [0, (strs[0]-strs[1]).abs]
[*2..(n-1)].each do |i|
  dp << [dp[i-2] + (strs[i-2]-strs[i]).abs, dp[i-1] + (strs[i-1]-strs[i]).abs].min
end
puts dp[-1]
