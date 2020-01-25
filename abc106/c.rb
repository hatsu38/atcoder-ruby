### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 1214
# 4
# output
# 2
# 1000兆は10 ** 15

s = gets.chomp.to_s.split('').map(&:to_i)
k = gets.to_i

not_s_index = s.index {|v| v > 1}.to_i
if k <= not_s_index
  puts 1
else
  puts s[not_s_index]
end
# sの先頭から1じゃないものが出てくるまでの数字を求める
