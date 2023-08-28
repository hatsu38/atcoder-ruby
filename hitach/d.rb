# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# a
# 6
# 2 2 a
# 2 1 b
# 1
# 2 2 c
# 1
# 1
# 出力例
# aabc

s = gets.chomp
q = gets.to_i
is_reverse = false
l = ''
r = ''
q.times do
  t = gets.split
  if t[0].to_i == 1
    is_reverse = !is_reverse
    next
  end
  f = t[1].to_i
  c = t[2]
  is_back = (f == 1 && is_reverse) || (f == 2 && !is_reverse)
  is_back ? r << c : l << c
end
ans = l.reverse + s + r
ans.reverse! if is_reverse
puts ans
