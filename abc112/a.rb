# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 119
# 出力例
# 991
n = gets.to_i
if n == 1
  puts 'Hello World'
  exit
end

a = gets.to_i
b = gets.to_i
puts a + b
