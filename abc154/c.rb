# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 2
# 10000000 10000000
# 出力例
# NO

n = gets.to_i
strs = gets.chomp.split.map(&:to_i)

if strs.uniq.size == n
  puts 'YES'
else
  puts 'NO'
end
