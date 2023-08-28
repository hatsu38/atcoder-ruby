# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 1 6 3
# 出力例
# 5
strs = gets.chomp.split.map(&:to_i).sort

ans = 0
strs.each_with_index do |num, idx|
  break if idx == strs.length - 1

  ans += strs[idx + 1] - num
end
puts ans
