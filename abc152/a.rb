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
# 3 3
# 出力例
# Yes
n, m = gets.chomp.split.map(&:to_i)

if n == m
  puts 'Yes'
else
  puts 'No'
end
