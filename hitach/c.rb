### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5
# 1 2
# 1 3
# 3 4
# 3 5
# output
# 1 2 5 4 3

n = gets.to_i
arys = []
arys << gets.chomp.split(' ').map(&:to_i)
(n-2).times do
  ary = gets.chomp.split(' ').map(&:to_i)
  puts arys.index(ary[0])
  puts arys.index(ary[1])
end

print arys
