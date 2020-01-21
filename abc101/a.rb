### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# problem a
# input
# +-++
# output
# 2
strs = gets.chomp.split('')
ans = 0
strs.each do |str|
  if str == '+'
    ans += 1
  else
    ans -= 1
  end
end
puts ans
