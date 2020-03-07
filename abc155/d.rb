### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 1000000000000
# output
# 1099511627775

# 2の体力のモンスターを倒すのに3回の攻撃が必要
# 3の体力のモンスターを倒すのに3回の攻撃が必要
# 4の体力のモンスターを倒すのに7回の攻撃が必要
# 5の体力のモンスターを倒すのに7回の攻撃が必要
# 6の体力のモンスターを倒すのに7回の攻撃が必要
# 7の体力のモンスターを倒すのに7回の攻撃が必要
# 8の体力のモンスターを倒すのに15回の攻撃が必要
# 9の体力のモンスターを倒すのに15回の攻撃が必要
# 10の体力のモンスターを倒すのに15回の攻撃が必要
# hが2のn乗の体力のモンスターを倒すのに15回の攻撃が必要

# h以下で、一番の2累乗に近い数字 * 2 - 1が答えになる

# 5以下で、一番の2累乗に近い数字をどう求めるか

# 2のべき乗のリストを持っておく？

h = gets.to_i
n = 0
while h >= 2**n
  n += 1
end
puts 2 ** (n-1) * 2 -1