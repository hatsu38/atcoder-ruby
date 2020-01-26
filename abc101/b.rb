### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

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
