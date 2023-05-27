# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 4
# 3 1 3 2
# output
# 1

n = gets.to_i
strs = gets.chomp.split.map(&:to_i)
if strs.uniq.size == 1
  puts n / 2
  exit
end

odd_ary = strs.each_slice(2).map(&:first)
even_ary = strs.each_slice(2).map(&:last)
diff_odd_size = odd_ary.size - odd_ary.group_by(&:itself).map { |_k, v| v.size }.max
diff_even_size = even_ary.size - even_ary.group_by(&:itself).map { |_k, v| v.size }.max
puts diff_odd_size + diff_even_size
