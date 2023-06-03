=begin
整数
Nが与えられます。 
Nの約数を列挙してください。

input
12
output
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
  if (n % i).zero?
    ans << i
    half_ans = n / i
    ans << half_ans if half_ans != i
  end
end

puts ans.sort