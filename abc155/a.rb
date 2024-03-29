# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 4 9 6
# 出力例
# No
strs = gets.chomp.split.map(&:to_i)

if strs.uniq.size == 2
  puts 'Yes'
else
  puts 'No'
end
