=begin
自然数 
N を素因数分解するプログラムを作成してください。

なお、任意の自然数の素因数分解は一意となることが知られています。
input
36
output
2 2 3 3
=end

n = gets.chomp.to_i

ans = []
(2..Math.sqrt(n).floor).each do |i|
  while (n % i).zero?
    ans << i
    n /= i
  end
end

ans << n if n != 1

puts ans.join(' ')
