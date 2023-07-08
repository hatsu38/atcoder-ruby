=begin
コンビニには N 個の品物が売られており、i 番目（1≤i≤N）の商品の値段は Ai円です。 異なる
2 つの品物を買う方法のうち、合計金額が
500 円となるものは何通りありますか。

2≤N≤200000
A iは 100,200,300,400 のいずれか

input
5
100 300 400 400 200
output
3

=end

N = gets.chomp.to_i
a_ary = gets.chomp.split.map(&:to_i)

hash = Hash.new { |a, key| a[key] = [] }

hash[100] = a_ary.count(100)
hash[200] = a_ary.count(200)
hash[300] = a_ary.count(300)
hash[400] = a_ary.count(400)

puts (hash[100] * hash[400]) + (hash[200] * hash[300])
