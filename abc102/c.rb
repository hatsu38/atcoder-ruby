# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5
# 2 2 3 5 5
# output
# 2
N = gets.to_i
strs = gets.split.map(&:to_i)

b_ary = []
strs.each_with_index do |str, idx|
  b_ary << (str - (idx + 1))
end
b_ary.sort!
b_middle_num = b_ary[N / 2]
sums = 0
strs.each_with_index do |str, idx|
  sums += (str - (b_middle_num + idx + 1)).abs
end
puts sums
