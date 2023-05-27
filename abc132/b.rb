# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem b
# input
# 5
# 1 3 5 4 2
# output
# 2
N = gets.chomp
strs = gets.chomp.split.map(&:to_i)
ans = 0
strs.each_with_index do |_str, idx|
  next if idx.zero? || idx == strs.size - 1

  ans += 1 if [strs[idx - 1], strs[idx], strs[idx + 1]].sort[1] == strs[idx]
end
puts ans
