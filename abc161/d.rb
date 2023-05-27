# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 100000
# output
# 3234566667

k = gets.to_i

# 100番目のルンルン数は？
# 1番目のルンルン数は？
ans = 0
num = 0
def runrun?(num)
  num.to_s.chars.each_with_index do |_n, i|
    return false if (num[i] - num[i + 1]).abs != 1
  end
  true
end
while ans != k
  num += 1
  puts '==='
  puts num
  puts runrun?(num)
  puts '==='
  ans += 1 if runrun?(num)
end
puts ans
