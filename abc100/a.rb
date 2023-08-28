# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 5 4
# 出力例
# Yay!
a, b = gets.chomp.split.map(&:to_i)

if a <= 8 && b <= 8
  puts 'Yay!'
else
  puts ':('
end
