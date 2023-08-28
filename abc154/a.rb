# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# red blue
# 5 5
# blue
# 出力例
# 5 4
s, = gets.chomp.split
a, b = gets.chomp.split.map(&:to_i)
u = gets.chomp

if u == s
  a -= 1
else
  b -= 1
end

print "#{a} #{b}"
