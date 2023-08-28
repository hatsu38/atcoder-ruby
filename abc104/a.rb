# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 1199
# 出力例ABC
R = gets.to_i

if R < 1200
  puts 'ABC'
elsif R >= 2800
  puts 'AGC'
else
  puts 'ARC'
end
