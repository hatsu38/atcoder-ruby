### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# C
# input
# 14
# 99592 10342 29105 78532 83018 11639 92015 77204 30914 21912 34519 80835 100000 1
# output
# 42685
N = gets.chomp.to_i
strs = gets.chomp.split(' ').map(&:to_i).sort
half_index = strs.size / 2
puts strs[half_index] - strs[half_index-1]
