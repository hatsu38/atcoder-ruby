=begin
赤・青のカードが各
1 枚ずつあり、あなたはそれぞれのカードに
1 以上
N 以下の整数を
1 つ書き込みます。

カードに書かれた整数の合計が
S 以下となる書き方は、いくつありますか？

input
869 120
output
7140
=end

n, s = gets.chomp.split.map(&:to_i)

puts((1..n).to_a.repeated_permutation(2).count { |a, b| a + b <= s })
