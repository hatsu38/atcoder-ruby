### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# problem a
# input
# 3 3
# output
# Yes
n,m = gets.chomp.split(' ').map(&:to_i)

if n == m
  puts 'Yes'
else
  puts 'No'
end
