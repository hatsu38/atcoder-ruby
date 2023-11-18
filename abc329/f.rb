=begin
## 問題文
1,2,…,Nの番号がついたN個の箱があり、はじめ箱iには色Ci​のボールが1つ入っています。
Q個のクエリが与えられるので、これらを順に処理してください。
各クエリは整数の組(a,b)によって与えられ、その内容は以下の通りです。
箱aのボールをすべて箱bに移し、その後箱bに何種類の色のボールが入っているかを出力する。
ただし、箱aや箱bが空の場合もあることに注意してください。

## 制約
1≤N,Q≤200000
1≤Ci​≤N
1≤a,b≤N
a≠b
入力される数値はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。ここで、 queryi​ は i 番目のクエリを意味する。
N Q
C1​ C2​ … CN​
query1​
query2​
⋮
queryQ​

各クエリは次の形式で与えられる。
a b

## 出力Q 行出力せよ。
i 行目には i 番目のクエリに対する答えを出力せよ。

## 入力例 1
6 5
1 1 1 2 2 3
1 2
6 4
5 1
3 6
4 6

## 出力例 1
1
2
1
1
3

1 番目のクエリでは、箱 1 のボールをすべて箱 2 に移します。箱 2 には色 1 のボールが 2 つ入っている状態となるため、1 を出力します。
2 番目のクエリでは、箱 6 のボールをすべて箱 4 に移します。箱 4 には色 2 のボールが 1 つ、色 3 のボールが 1 つ入っている状態となるため、2 を出力します。
3 番目のクエリでは、箱 5 のボールをすべて箱 1 に移します。箱 1 には色 2 のボールが 1 つ入っている状態となるため、1 を出力します。
4 番目のクエリでは、箱 3 のボールをすべて箱 6 に移します。箱 6 には色 1 のボールが 1 つ入っている状態となるため、1 を出力します。
5 番目のクエリでは、箱 4 のボールをすべて箱 6 に移します。箱 6 には色 1 のボールが 1 つ、色 2 のボールが 1 つ、色 3 のボールが 1 つ入っている状態となるため、3 を出力します。

## 入力例 2
5 3
2 4 2 4 2
3 1
2 5
3 2

## 出力例 2
1
2
0

=end

require 'prime'
require 'set'

n, q = gets.chomp.split.map(&:to_i)
c = gets.chomp.split.map { _1.to_i - 1 }

queries = Array.new(q) { gets.chomp.split.map { _1.to_i - 1 } }

idx = (0...n).to_a

boxes = Array.new(n) { Set.new }
n.times do |i|
  boxes[i].add(c[i])
end

queries.each do |a, b|
  if boxes[idx[a]].size <= boxes[idx[b]].size
    boxes[idx[b]].merge(boxes[idx[a]])
    boxes[idx[a]].clear
  else
    boxes[idx[a]].merge(boxes[idx[b]])
    boxes[idx[b]].clear
    idx[a], idx[b] = idx[b], idx[a]
  end

  puts boxes[idx[b]].size
end
