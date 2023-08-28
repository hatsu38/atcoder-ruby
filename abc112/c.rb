# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3
# 99 1 191
# 100 1 192
# 99 0 192
# 出力例
# 100 0 193

# h - |x-cx| - |y-cy|

n = gets.to_i
strs = Array.new(n) { gets.chomp.split.map(&:to_i) }
cx = 0
cy = 0
print strs
strs.each_with_index do |str, _idx|
  puts str[2] - (str[0] - cx).abs
  puts (str[1] - cy).abs
end
