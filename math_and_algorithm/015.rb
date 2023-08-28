=begin
A と
B の最大公約数を求めてください。

入力例
123 777
出力例
3
=end

n, s = gets.chomp.split.map(&:to_i)

puts n.gcd(s)
