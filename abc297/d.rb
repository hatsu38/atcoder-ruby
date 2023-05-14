### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 正整数 
# A,B が与えられます。

# あなたは、
# A=B になるまで以下の操作を繰り返します。

# A,B の大小関係に応じて、次の 
# 2 個のうちどちらかの処理を行う。
# A>B ならば、
# A を 
# A−B で置き換える。
# A<B ならば、
# B を 
# B−A で置き換える。
# A=B になるまで、操作を何回行うか求めてください。ただし、有限回の操作で 
# A=B になることが保証されます。

# input
# 3 8
# output
# 4

h, w = gets.chomp.split(' ').map(&:to_i).minmax

cnt = 0

while h != w
  cnt += 1
  h > w ? h -= w : w -= h
end

p cnt
