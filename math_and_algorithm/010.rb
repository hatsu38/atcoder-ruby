=begin
N! の値を求めてください。

input
5
output
120
=end

n = gets.chomp.to_i

puts (1..n).inject(:*)
