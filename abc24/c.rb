### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 314159265 10 1
# 1 10000
# 500 12031
# 1414 113232
# 111111 777777
# 666661 23423423
# 12345678 123456789
# 111111111 314159265
# 112334 235235235
# 1 223445
# 314 1592
# 1 314159265
# output
# 7

n, d, k = gets.chomp.split(' ').map(&:to_i)
lr_ary = d.times.map{ gets.chomp.split(' ') }
st_ary = k.times.map{ gets.chomp.split(' ') }

print lr_ary
puts ''
print st_ary
