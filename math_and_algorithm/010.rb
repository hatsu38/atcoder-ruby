=begin
N! の値を求めてください。

入力例
5
出力例
120
=end

n = gets.chomp.to_i

puts (1..n).inject(:*)
