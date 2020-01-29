### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 100 5
# 1
# 23
# 45
# 67
# 89
# output
# 608200469

n, m = gets.chomp.split(' ').map(&:to_i)
strs = Hash.new
m.times.map { strs[gets.to_i] = true }
MOD = 10**9+7
dp = Array.new(n+10, 0)
dp[0] = 1

n.times do |idx|
  if strs[idx]
    dp[idx] = 0
  else
    dp[idx+1] += dp[idx] if !strs[idx+1]
    dp[idx+2] += dp[idx] if !strs[idx+2]
  end
end
print dp[n] % MOD
