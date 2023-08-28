# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 4
# ushi
# tapu
# nichia
# kun
# 出力例
# kun
# nichia
# tapu
# ushi

n = gets.to_i
strs = []
n.times do
  strs << gets.chomp!.to_s
end

ary = strs.group_by(&:itself)
lists = ary.map { |k, v| [k, v.count] }.sort
max = ary.map { |_k, v| v.count }.max
lists.each do |k, v|
  puts k if v == max
end
