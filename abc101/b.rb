# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem b
# 入力例
# 12
# 出力例
# Yes

N = gets.chomp
sum = N.chars.sum(&:to_i)
if (N.to_i % sum).zero?
  puts 'Yes'
else
  puts 'No'
end
