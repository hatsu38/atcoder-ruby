### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# problem a
# input
# ASSA
# output
# Yes
strs = gets.chomp.split('')
if strs.count(strs.uniq[0]) == 2 && strs.count(strs.uniq[1]) == 2
  puts 'Yes'
else
  puts 'No'
end
