=begin
整数列A=(A1,A2,…,AN) があります。
あなたは次の操作を好きな回数（0 回でもよい）行うことができます。
1≤i,j≤N を満たす整数i,j を選ぶ。
Aiを1 減らし、Ajを 1 増やす。
A の最小値と最大値の差を 1 以下にするために必要な最小の操作回数を求めてください。

制約
1≤N≤2×10 ** 5
1≤Ai≤10 ** 9
入力は全て整数

# input
4
4 7 3 7

# output
3

# input
1
313

# output
0

# input
10
999999997 999999999 4 3 2 4 999999990 8 999999991 999999993

# output
2499999974

=end

require 'prime'

N = gets.chomp.to_i
A_ARY = gets.chomp.split.map(&:to_i).sort

average = A_ARY.sum / N
d = A_ARY.sum % N
ar1 = Array.new(N - d, average)
ar2 = Array.new(d, average + 1)

ar = ar1 + ar2

ans = 0
N.times do |i|
  ans += (A_ARY[i] - ar[i]).abs
end
puts ans / 2
