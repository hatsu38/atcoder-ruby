=begin
N 個の正の整数
A
1
​
 ,A
2
​
 ,…,A
N
​
  の最小公倍数を求めてください。

入力例
3
12 18 14
出力例
252
=end

gets.chomp.to_i
a_ary = gets.chomp.split.map(&:to_i).sort

puts(a_ary.inject { |a, b| a.lcm(b) })
