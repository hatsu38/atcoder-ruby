# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 1214
# 4
# output
# 2
# 1000兆は10 ** 15

s = gets.chomp.to_s.chars.map(&:to_i)
k = gets.to_i

not_s_index = s.index { |v| v > 1 }.to_i
if k <= not_s_index
  puts 1
else
  puts s[not_s_index]
end
# sの先頭から1じゃないものが出てくるまでの数字を求める
