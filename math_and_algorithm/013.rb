=begin
整数
Nが与えられます。
Nの約数を列挙してください。

入力例
12
出力例
1
2
3
4
6
12
=end

n = gets.chomp.to_i

ans = []
(1..Math.sqrt(n).floor).each do |i|
  next unless (n % i).zero?

  ans << i
  half_ans = n / i
  ans << half_ans if half_ans != i
end

puts ans.sort
