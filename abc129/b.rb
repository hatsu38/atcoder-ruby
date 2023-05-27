# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 8
# 27 23 76 2 3 5 62 52
# output
# 2
n = gets.to_i
strs = gets.chomp.split.map(&:to_i)

min = 10 * 100
strs.each_with_index do |_str, idx|
  break if idx == n - 1

  diff = (strs[0..idx].sum - strs[(idx + 1)..].sum).abs
  min = diff if diff < min
end
puts min
