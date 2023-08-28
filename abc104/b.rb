# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# AtCoder
# 出力例
# Yes
S = gets.chomp

if S[0] == 'A' && S[2..-2].count('C') == 1 && S.scan(/[a-z]/).size == S.size - 2
  puts 'AC'
else
  puts 'WA'
end
