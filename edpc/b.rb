### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5 3
# 10 30 40 50 20
# output
# 30
n, k = gets.chomp.split(' ').map(&:to_i)
strs = gets.chomp.split(' ').map(&:to_i)
dp = Array.new(n,0)
dp[0] = 0
dp[1] = (strs[0]-strs[1]).abs

[*2..(n-1)].each do |i|
  min = Float::INFINITY
  [*1..k].each do |j|
    break if j > i
    tmp = dp[i - j] + (strs[i]-strs[i-j]).abs
    min = tmp if tmp < min
  end
  dp[i] = min
end
puts dp[n-1]
