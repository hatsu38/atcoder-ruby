# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem D
# 入力例
# 200000
# 出力例
# 400000008
N = gets.chomp.to_i
h = {}
[*1..9].each do |i|
  [*1..9].each do |j|
    h[[i, j]] = 0
  end
end
[*1..N].each do |num|
  i = num.to_s[0].to_i
  j = num.to_s[-1].to_i
  h[[i, j]] += 1 if j != 0
end
nas = 0
[*1..9].each do |i|
  [*1..9].each do |j|
    # puts "--i=#{i}---j=#{j}---"
    # puts "h[[#{i},#{j}]]が#{h[[i,j]]}個"
    # puts "h[[#{j},#{i}]]}が#{h[[j,i]]}個"
    nas += h[[i, j]] * h[[j, i]]
  end
end
puts nas
