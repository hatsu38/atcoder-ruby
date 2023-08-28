# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 11
# 出力例
# Yes
n = gets.to_i

def yes?(x)
  return false unless (x % 4).zero? || (x % 7).zero? || (x % 11).zero?

  puts 'Yes'
  exit
end

while n >= 4
  yes?(n)
  n -= 4
end

puts 'No'
