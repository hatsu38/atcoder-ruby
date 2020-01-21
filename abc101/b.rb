### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# problem b
# input
# 12
# output
# Yes

N = gets.chomp
sum = N.split('').map(&:to_i).inject(:+)
if N.to_i % sum == 0
  puts 'Yes'
else
  puts 'No'
end
