=begin
AtCoder 商店には N 個の商品があります。
i (1≤i≤N) 番目の商品の価格は P iです。
i (1≤i≤N) 番目の商品は C i個の機能をもち、
i (1≤i≤N) 番目の商品の j (1≤j≤C i) 番目の機能は
1 以上 M 以下の整数 F i,jとして表されます。

高橋くんは、AtCoder 商店の商品で一方が一方の上位互換であるものがないか気になりました。
i 番目の商品と j 番目の商品 (1≤i,j≤N) であって、
次の条件をすべて満たすものがあるとき Yes と、ないとき No と出力してください。

P i≥P jである。j 番目の製品は i 番目の製品がもつ機能をすべてもつ。
P i>P jであるか、j 番目の製品は i 番目の製品にない機能を 1 つ以上もつ。

# input
5 6
10000 2 1 3
15000 3 1 2 4
30000 3 1 3 5
35000 2 1 5
100000 6 1 2 3 4 5 6

# output
Yes

# input
4 4
3 1 1
3 1 2
3 1 2
4 2 2 3

# output
No

# input
20 10
72036 3 3 4 9
7716 4 1 2 3 6
54093 5 1 6 7 8 10
25517 7 3 4 5 6 7 9 10
96930 8 2 3 4 6 7 8 9 10
47774 6 2 4 5 6 7 9
36959 5 1 3 4 5 8
46622 7 1 2 3 5 6 8 10
34315 9 1 3 4 5 6 7 8 9 10
54129 7 1 3 4 6 7 8 9
4274 5 2 4 7 9 10
16578 5 2 3 6 7 9
61809 4 1 2 4 5
1659 5 3 5 6 9 10
59183 5 1 2 3 4 9
22186 4 3 5 6 8
98282 4 1 4 7 10
72865 8 1 2 3 4 6 8 9 10
33796 6 1 3 5 7 9 10
74670 4 1 2 6 8

# output
Yes

=end

require 'prime'
N, M = gets.chomp.split.map(&:to_i)
price_hash = {}
count_hash = {}
function_hash = {}

N.times do |i|
  f_ary = gets.chomp.split.map(&:to_i)
  price_hash[i] = f_ary.shift
  count_hash[i] = f_ary.shift
  function_hash[i] = f_ary
end

price_hash.each do |i, price|
  price_hash.each do |j, j_price|
    next if i == j

    next unless price >= j_price &&
                (function_hash[i] - function_hash[j]).empty? &&
                (price > j_price || !(function_hash[j] - function_hash[i]).empty?)

    puts 'Yes'
    exit
  end
end

puts 'No'
