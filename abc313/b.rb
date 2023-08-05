=begin
N 人の競技プログラマーがいます。順に 人1, 人
2,…, 人N と呼びます。
競技プログラマーの間には 強さ と呼ばれる関係性があり、相異なる 2 人組
(人X, 人Y) 全てに対して 「人X は人Y より強い」または「人Y は人X より強い」のどちらか一方が成り立ちます。
強さ は 推移律 が成り立ちます。
言い換えると、相異なる 3 人組
(人X, 人Y, 人Z) 全てに対して次の条件が成り立ちます。
人X が人Y よりも強く、かつ人Y が人Z よりも強いとき、人X は人Z よりも強い。
人X が自分以外のどの人Y に対しても「人X は人Y より強い」という関係が成り立つ時、
人X を 最強のプログラマー と呼びます。
(上記の制約下においてそのような人がちょうど 1 人存在することが証明できます)

あなたはM 個の強さに関する情報を知っています。
i 個目の情報は「人Aiは人Biより強い」という情報です。
あなたは情報を元にN 人の中から最強のプログラマーを特定することができますか？
最強のプログラマーを特定できる場合はその人の番号を出力してください。
特定できない場合、つまり最強のプログラマーとしてあり得る人が複数人いる場合は -1 を出力してください。

制約
2≤N≤50
0≤M≤ N(N−1)/2

1≤Ai,Bi≤N
Ai ≠ Bi
​i≠j ならば
(Ai,Bi)≠(Aj,Bj)
全ての情報が正しくなるように、全ての相異なる2 人組にどちらが強いかを割り当てる方法が少なくとも1 通り存在する

# input
3 2
1 2
2 3

# output
1

# input
3 2
1 3
2 3

# output
-1

# input
6 6
1 6
6 5
6 2
2 3
4 3
4 2

# output
-1

=end

require 'prime'
N, M = gets.chomp.split.map(&:to_i)

wineers_hash = {}
losers_hash = {}

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  wineers_hash[a] ? wineers_hash[a] << b : wineers_hash[a] = [b]
  losers_hash[b] ? losers_hash[b] << a : losers_hash[b] = [a]
end

storngest = []

wineers_hash.each do |k, _|
  next if losers_hash[k]

  storngest << k
end

puts storngest.size == 1 ? storngest[0] : -1
