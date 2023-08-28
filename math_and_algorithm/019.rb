=begin
N 枚のカードがあり、左から i 番目（1≤i≤N）のカードの色は A iです。
A i=1 のとき赤色、A i=2 のとき黄色、A i=3 のとき青色です。
同じ色のカードを 2 枚選ぶ方法は何通りありますか。

入力例
6
1 3 2 1 1 2
出力例
4
=end

N = gets.chomp.to_i
a_ary = gets.chomp.split.map(&:to_i).sort

hash = Hash.new { |a, key| a[key] = [] }

hash[1] = a_ary.count(1)
hash[2] = a_ary.count(2)
hash[3] = a_ary.count(3)

puts (hash[1] * (hash[1] - 1) / 2) + (hash[2] * (hash[2] - 1) / 2) + (hash[3] * (hash[3] - 1) / 2)
