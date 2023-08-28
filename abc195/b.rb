=begin
みかんがたくさんあります。どのみかんの重さも
A グラム以上
B グラム以下であることがわかっています。（みかんの重さは整数とは限りません。）

この中からいくつかのみかんを選んだところ、選んだみかんの重さの合計がちょうど
W キログラムになりました。

選んだみかんの個数として考えられる最小値と最大値を求めてください。ただし、このようなことが起こり得ないなら、かわりにそのことを報告してください。

制約
1≤A≤B≤1000
1≤W≤1000
入力は全て整数

# 入力例
100 200 2

# 出力例
10 20

# 入力例
120 150 2

# 出力例
14 16

# 入力例
300 333 1

# 出力例
UNSATISFIABLE

=end

require 'prime'

a, b, w = gets.chomp.split.map(&:to_i)

w *= 1000

max = 0

tmp_a_w = w
while tmp_a_w >= a
  max += 1
  tmp_a_w -= a
end

tmp_b_w = w
if max * b < tmp_b_w
  puts 'UNSATISFIABLE'
  exit
end

min = 0
while w.positive?
  min += 1
  w -= b
end

puts [min, max].join(' ')
