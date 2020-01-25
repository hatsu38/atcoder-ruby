### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# AtCoder
# output
# Yes
S = gets.chomp

if S[0] == 'A' && S[2..-2].count('C') == 1 && S.scan(/[a-z]/).size == S.size-2
  puts 'AC'
else
  puts 'WA'
end
