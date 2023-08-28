# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem d
# 入力例
# 5 3
# 1 -2 3
# -4 5 -6
# 7 -8 -9
# -10 11 -12
# 13 -14 15
# 出力例
# 54

cake_kind_cnt, cake_select_cnt = gets.chomp.split.map(&:to_i)
strs = []
cake_kind_cnt.times do
  strs << gets.chomp.split.map(&:to_i)
end

if cake_select_cnt < 1
  puts 0
  exit
end

sums = []
calculated_strs = []
[1, -1].repeated_permutation(3) do |n|
  calculated_strs = strs.collect do |x, y, z|
    (x * n[0]) + (y * n[1]) + (z * n[2])
  end
  calculated_strs.sort!
  calculated_strs.reverse!
  sums << calculated_strs[0..(cake_select_cnt - 1)].sum
end

puts sums.max
