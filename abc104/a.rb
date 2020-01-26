### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 1199
# outputABC
R = gets.to_i

if R < 1200
  puts 'ABC'
elsif R >= 2800
  puts 'AGC'
else
  puts 'ARC'
end

