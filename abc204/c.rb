=begin
## 問題文
AtCoder国には1からNの番号がついたN個の都市と、1からMの番号がついたM個の道路があります。
道路iを通ると都市Ai​からBi​へ移動することができます。
都市Bi​から都市Ai​への通行はできません。
ピューマは、どこかの都市からスタートし、0本以上の道路を使い移動して、どこかの都市をゴールとするような旅行の計画を立てようとしています。
スタート地点とゴール地点の都市の組として考えられるものは何通りありますか？

## 制約
2≤N≤2000
0≤M≤min(2000,N(N−1))
1≤Ai​,Bi​≤N
Ai​≠Bi​
(Ai​,Bi​) は相異なる
入力に含まれる値は全て整数である

## 入力入力は以下の形式で標準入力から与えられる。
N M
A1​ B1​
⋮
AM​ BM​

## 出力答えを出力せよ。

## 入力例 1
3 3
1 2
2 3
3 2

## 出力例 1
7

スタート地点とゴール地点の組として考えられるものは (1,1),(1,2),(1,3),(2,2),(2,3),(3,2),(3,3) の 7 通りです。

## 入力例 2
3 0

## 出力例 2
3

スタート地点とゴール地点の組として考えられるものは (1,1),(2,2),(3,3) の 3 通りです。

## 入力例 3
4 4
1 2
2 3
3 4
4 1

## 出力例 3
16

スタート地点とゴール地点の組として全ての都市の組み合わせが可能です。
=end

# BFS

require 'prime'

n, m = gets.split.map(&:to_i)
graph = {}

m.times do
  u, v = gets.split.map(&:to_i)
  graph[u] ||= []
  graph[u] << v
end

ans = 0

(1..n).each do |i|
  arrived = {}
  arrived[i] = true
  que = [i]
  ans += 1
  v = que.shift
  while v
    graph[v]&.each do |val|
      next if arrived[val]

      que << val
      arrived[val] = true
      ans += 1
    end
    v = que.shift
  end
end

p ans
