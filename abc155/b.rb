# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3
# 28 27 24
# 出力例
# DENIED
gets.to_i
strs = gets.chomp.split.map(&:to_i)

even_ary = strs.uniq.select(&:even?)
if even_ary.all? { |num| (num % 3).zero? || (num % 5).zero? }
  puts 'APPROVED'
else
  puts 'DENIED'
end
