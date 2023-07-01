=begin
1 から N の番号が付いた N 人がコイントスを何回かしました。
人 i は A i回表を出し、Bi回裏を出したこと分かっています。
人 i のコイントスの 成功率 は Ai / Ai+ Bi
で定義されます。
人 1,…,N の番号を、成功率の高い順に並び替えてください。
成功率が同じ人が複数いる場合、その中では人の番号が小さい順になるように並び替えてください。

制約
2≤N≤2×10**50
0 ≤Ai,Bi≤10**9
Ai+Bi≥1
入力される数値は全て整数

# input
3
1 3
3 1
2 2

# output
2 3 1

# input
2
1 3
2 6

# output
1 2

# input
4
999999999 1000000000
333333333 999999999
1000000000 999999997
999999998 1000000000

# output
3 1 4 2

=end

require 'prime'

N = gets.chomp.to_i

a_hash = {}
N.times do |i|
  a, b = gets.chomp.split.map(&:to_i)
  a_hash[i + 1] = Rational(a, a + b)
end

sorted = a_hash.sort_by { |k, v| [-v, k] }
puts sorted.map { |k, _| k }.join(' ')
