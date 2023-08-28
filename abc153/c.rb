# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3 1
# 4 1 5
# 出力例
# 5

_, k = gets.chomp.split.map(&:to_i)
strs = gets.chomp.split.map(&:to_i).sort

if k >= strs.size
  puts 0
  exit
end
strs.slice!(-k, k)
print strs.sum
