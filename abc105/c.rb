### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 123456789
# output
# 11000101011001101110100010101

n = gets.to_i
# nが奇数のとき、s0 = 1
ans = []
while true do
  if n % 2 == 1
    ans.unshift(1)
    n -= 1
  else
    ans.unshift(0)
  end
  break if n == 0 || n == 1
  n /= -2
end
puts ans.join('')
