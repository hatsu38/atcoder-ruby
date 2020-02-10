### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3
# 99 1 191
# 100 1 192
# 99 0 192
# output
# 100 0 193

# h - |x-cx| - |y-cy|

n = gets.to_i
strs = n.times.map{ gets.chomp.split(' ').map(&:to_i) }
cx = 0
cy = 0
print strs
strs.each_with_index do |str, idx|
  puts str[2] - (str[0]-cx).abs
  puts (str[1]-cy).abs
end
