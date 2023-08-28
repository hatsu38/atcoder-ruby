# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# abcdefghijklmnopqrstuvwxyz
# ibyhqfrekavclxjstdwgpzmonu
# 出力例
# Yes

s = gets.chomp.chars
t = gets.chomp.chars
puts s.group_by(&:itself).map { |_k, v| v.size } == t.group_by(&:itself).map { |_k, v| v.size } ? 'Yes' : 'No'
