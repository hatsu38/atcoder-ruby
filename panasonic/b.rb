# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 21
# 出力例
# 11

h, w = gets.chomp.split.map(&:to_i)

odd_h_num = h.odd? ? (h + 1) / 2 : h / 2
odd_w_num = w.odd? ? (w + 1) / 2 : w / 2

pre = (odd_h_num * odd_w_num)
aft = (h - odd_h_num) * (w - odd_w_num)
puts pre + aft
