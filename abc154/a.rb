### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# red blue
# 5 5
# blue
# output
# 5 4
s, t = gets.chomp.split(' ')
a, b = gets.chomp.split(' ').map(&:to_i)
u = gets.chomp

if u == s
  a -= 1
else
  b -= 1
end

print "#{a} #{b}"
