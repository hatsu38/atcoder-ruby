=begin
A と
B の最大公約数を求めてください。

input
123 777
output
3
=end

n, s = gets.chomp.split.map(&:to_i)

puts n.gcd(s)
