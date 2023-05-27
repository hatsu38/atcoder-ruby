# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3
# 5 2 4
# N = 3
# strs = [5,2,4]
# output
# 3

N = gets.chomp.split.map(&:to_i)
strs = gets.chomp.split.map(&:to_i)

i = 0
strs.select!(&:even?)
strs.each do |str|
  while str.even?
    i += 1
    str /= 2
  end
end
puts i
