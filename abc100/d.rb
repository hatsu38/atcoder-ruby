### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# problem d
# input
# 5 3
# 3 1 4
# 1 5 9
# 2 6 5
# 3 5 8
# 9 7 9
# output
# 56
# 解けてない！
cake_kind_cnt,cake_select_cnt = gets.chomp.split(" ").map(&:to_i)
strs = []
cake_kind_cnt.times do
  strs << gets.chomp.split(" ").map(&:to_i)
end

sums = []
strs.each do |str|
  sums << str.inject(:+)
end
print sums.max(cake_select_cnt).inject(:+)
