### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

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
