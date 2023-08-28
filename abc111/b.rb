# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 750
# 出力例
# 777
n = gets.to_i
[*n..999].each do |num|
  next if num.to_s.chars.uniq.size != 1

  puts num
  break
end
