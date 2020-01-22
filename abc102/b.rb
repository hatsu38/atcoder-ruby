### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 4
# 1 4 6 3
# output
# 5
N = gets.to_i
strs = gets.split.map(&:to_i).map(&:abs).sort

puts strs[-1] - strs[0]

