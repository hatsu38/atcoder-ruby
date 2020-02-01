### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 6 15
# 6 5
# 5 6
# 6 4
# 6 6
# 3 5
# 7 2
# output
# 17
n, max_w = gets.chomp.split(' ').map(&:to_i)
strs = n.times.map { gets.chomp.split(' ').map(&:to_i) }

dp = Array.new(max_w + 10, 0)
dp[0] = 0
ans = 0
strs.each do |w, v|
  (max_w - w).downto(0) do |idx|
    nv = dp[idx] + v
    nw = idx + w
    dp[nw] = nv if dp[nw] < nv
  end
end
print dp[max_w]
