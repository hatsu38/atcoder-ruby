### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 6 6 7
# output
# 87
strs = gets.chomp.split(' ').map(&:to_i).sort

puts (strs[-1].to_s + strs[1].to_s).to_i + strs[0]
