# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5 9
# 25 8
# 5 9
# 4 10
# 1000 1000
# 6 1
# output
# 5
n, t = gets.chomp.split.map(&:to_i)
strs = Array.new(n) { gets.chomp.split.map(&:to_i) }
ok_path = strs.select { |str| str[1] <= t }
if ok_path.empty?
  puts 'TLE'
else
  puts ok_path.min_by { |str| str[0] }[0]
end
