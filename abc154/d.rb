### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 10 4
# 17 13 13 12 15 20 10 13 17 11
# output
# 32.000000000000

# n, k = gets.chomp.split(' ').map(&:to_i)
# strs = gets.chomp.split(' ').map(&:to_i)

# max_num_ary = []
# max_num = 0
# strs.each_cons(k) do |str|
#   ary_sum = str.sum
#   next if ary_sum < max_num
#   max_num = ary_sum
#   max_num_ary = str
# end

# arys = 0
# max_num_ary.each do |s|
#   arys += [*1..s].sum.to_f / s
# end
# print arys

n, k = gets.chomp.split(' ').map(&:to_i)
strs = gets.chomp.split(' ').map(&:to_i)

max_num = sum = strs[0...k].inject(:+)
[*k...n].each do |i|
  sum = sum - strs[i - k] + strs[i]
  max_num = sum if max_num < sum
end
puts (max_num+k).to_f/2

# max_num_ary = []
# max_num = 0
# strs.each_cons(k) do |str|
#   ary_sum = str.inject(:+)
#   next if ary_sum < max_num
#   max_num = ary_sum
#   max_num_ary = str
# end
# print (max_num_ary.inject(:+) + k).to_f / 2



# arys = 0
# max_num_ary.each_with_index do |s, i|
#   arys += (1+s).to_f / 2
# end
# print arys
