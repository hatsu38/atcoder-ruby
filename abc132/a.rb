# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem a
# 入力例
# ASSA
# 出力例
# Yes
strs = gets.chomp.chars
if strs.count(strs.uniq[0]) == 2 && strs.count(strs.uniq[1]) == 2
  puts 'Yes'
else
  puts 'No'
end
