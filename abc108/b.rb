# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 31 -41 -59 26
# output
# -126 -64 -36 -131
x1, y1, x2, y2 = gets.chomp.split.map(&:to_i)
x_dist = x1 - x2
y_dist = y1 - y2

x3 = x2 + y_dist
y3 = y2 - x_dist

x4 = x1 + y_dist
y4 = y1 - x_dist
print [x3, y3, x4, y4].join(' ')
