=begin

1,2,…,Nの番号がついたN個の皿と、1,2,…,Mの番号がついたM個の条件があります。
条件iは、皿Ai​と皿Bi​の両方にボールが(1個以上)置かれているとき満たされます。
1,2,…,Kの番号がついたK人の人がいて、人iは皿Ci​か皿Di​のどちらか一方にボールを置きます。
満たされる条件の個数は最大でいくつでしょうか？

制約
入力は全て整数
2≤N≤100
1≤M≤100
1≤Ai​<Bi​≤N
1≤K≤ 16
1≤Ci​<Di​≤N

入力入力は以下の形式で標準入力から与えられる。
N M
A1​ B1​
⋮
AM​ BM​
K
C1​ D1​
⋮
CK​ DK​

出力答えを出力せよ。

入力例 1
4 4
1 2
1 3
2 4
3 4
3
1 2
1 3
2 3

出力例 1
2

例えば、人 1,2,3 がそれぞれ皿 1,3,2 にボールを置くと、条件 1,2 の 2 つが満たされます。

入力例 2
4 4
1 2
1 3
2 4
3 4
4
3 4
1 2
2 4
2 4

出力例 2
4

例えば、人 1,2,3,4 がそれぞれ皿 3,1,2,4 にボールを置くと、全ての条件が満たされます。

入力例 3
6 12
2 3
4 6
1 2
4 5
2 6
1 5
4 5
1 3
1 2
2 6
2 3
2 5
5
3 5
1 4
2 6
4 6
5 6

出力例 3
9

=end

require 'prime'

n, m = gets.split.map(&:to_i)

ab_ary = []
m.times do |_i|
  ab_ary << gets.split.map(&:to_i)
end

k = gets.chomp.to_i

cd_ary = []
k.times do |_i|
  cd_ary << gets.split.map(&:to_i)
end

max_conditions = 0

[0, 1].repeated_permutation(k).each do |pattern|
  balls = Array.new(n, 0)

  pattern.each_with_index do |choice, index|
    balls[cd_ary[index][choice] - 1] += 1
  end

  satisfied_conditions = 0

  ab_ary.each do |ab|
    satisfied_conditions += 1 if (balls[ab[0] - 1]).positive? && (balls[ab[1] - 1]).positive?
  end

  max_conditions = [max_conditions, satisfied_conditions].max
end

puts max_conditions
