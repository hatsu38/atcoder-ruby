# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 60 88 34
# 92 41 43
# 65 73 48
# 10
# 60
# 43
# 88
# 11
# 48
# 73
# 65
# 41
# 92
# 34
# 31 41 59 26 53
# output
# Yes

bingos = Array.new(3) { gets.chomp.split.map(&:to_i) }.flatten
n = gets.to_i
arys = []
n.times do
  arys << gets.to_i
end

arys.each do |ary|
  idx = bingos.index(ary)
  bingos[idx] = nil if idx
end

if (bingos[0].nil? && bingos[3].nil? && bingos[6].nil?) ||
   (bingos[1].nil? && bingos[4].nil? && bingos[7].nil?) ||
   (bingos[2].nil? && bingos[5].nil? && bingos[8].nil?) ||
   (bingos[0].nil? && bingos[4].nil? && bingos[8].nil?) ||
   (bingos[2].nil? && bingos[4].nil? && bingos[6].nil?) ||
   (bingos[0].nil? && bingos[1].nil? && bingos[2].nil?) ||
   (bingos[3].nil? && bingos[4].nil? && bingos[5].nil?) ||
   (bingos[6].nil? && bingos[7].nil? && bingos[8].nil?)
  print 'Yes'
else
  print 'No'
end
