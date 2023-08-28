# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem a
# 入力例
# +-++
# 出力例
# 2
strs = gets.chomp.chars
ans = 0
strs.each do |str|
  if str == '+'
    ans += 1
  else
    ans -= 1
  end
end
puts ans
