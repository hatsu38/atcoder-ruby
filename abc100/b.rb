# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 0 5
# 出力例
# 5
_, n = gets.chomp.split.map(&:to_i)
if n < 100
  puts (100**0) * 100
else
  # (例えばd=0で)n=100のとき、100番目に小さい数は100になるが、これは100でちょうど割り切れるので、100はカウントできない。101が100番目に100で割り切れない小さい数となる
  puts (100**0) * (100 + 1)
end
