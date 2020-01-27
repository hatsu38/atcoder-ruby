### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 10 4
# output
# 3
h, a = gets.chomp.split(' ').map(&:to_i)
ans = 0
while h>0
  ans += 1
  h -= a
end
puts ans
