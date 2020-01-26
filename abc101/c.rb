### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem c
# input
# 4 3
# 2 3 1 4
# output
# 2
n,k = gets.chomp.split(' ').map(&:to_i)
strs = gets.chomp.split(' ').map(&:to_i).sort
ans = 0

while(n > 0)
  n -= k
  n += 1 if n > 0
  ans += 1
end

puts ans
