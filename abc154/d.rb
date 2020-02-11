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

n, k = gets.chomp.split(' ').map(&:to_i)
strs = gets.chomp.split(' ').map(&:to_i)

max_num = sum = strs[0...k].inject(:+)
[*k...n].each do |i|
  sum = sum - strs[i - k] + strs[i]
  max_num = sum if max_num < sum
end
puts (max_num+k).to_f/2
