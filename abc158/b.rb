# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 8 3 4
# 出力例
# 4

n, blue, red = gets.chomp.split.map(&:to_i)
baul_cnt = blue + red
repeat_cnt = n / baul_cnt
amari_cnt = n % baul_cnt

plus_amri = [blue, amari_cnt].min

puts (repeat_cnt * blue) + plus_amri

# while baul_cnt <= n
#   baul_cnt * n
#   baul_cnt += cnt
# end

# puts n
