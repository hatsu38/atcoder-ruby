# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 41 59 31
# 出力例
# 31 41 59

strs = gets.chomp.split
print "#{strs[2]} #{strs[0]} #{strs[1]}"
