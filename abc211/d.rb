=begin
## 問題文
AtCoder国には1からNの番号がついたN個の都市と、1からMの番号がついたM個の道路があります。
道路iを通ると都市Ai​と都市Bi​の間を双方向に1時間で移動することができます。
都市1から都市Nへ最も早く移動することができる経路は何通りありますか？答えは非常に大きくなる可能性があるので(10**9+7)で割ったあまりを求めてください。

## 制約
2≤N≤2×10**5
0≤M≤2×10**5
1≤Ai​<Bi​≤N
(Ai​,Bi​) は相異なる
入力に含まれる値は全て整数である

## 入力入力は以下の形式で標準入力から与えられる。
N M
A1​ B1​
⋮
AM​ BM​

## 出力答えを出力せよ。
都市 1 から都市 N へ移動することが出来ない場合は 0 と出力せよ。

## 入力例 1
4 5
2 4
1 2
2 3
1 3
3 4

## 出力例 1
2

都市 1 から都市 4 へは最短 2 時間で移動することができ、それを実現する経路は 1→2→4 と 1→3→4 の 2 つです。

## 入力例 2
4 3
1 3
2 3
2 4

## 出力例 2
1

都市 1 から都市 4 へは最短 3 時間で移動することができ、それを実現する経路は 1→3→2→4 の 1 つです。

## 入力例 3
2 0

## 出力例 3
0

都市 1 から都市 2
に移動することはできません。この場合 0 を出力してください。

## 入力例 4
7 8
1 3
1 4
2 3
2 4
2 5
2 6
5 7
6 7

## 出力例 4
4

=end

require 'prime'

n, m = gets.chomp.split.map(&:to_i)

ab_hash = {}

mod_num = (10**9) + 7

m.times do
  a, b = gets.chomp.split.map(&:to_i)
  ab_hash[a] ||= []
  ab_hash[a] << b
  ab_hash[b] ||= []
  ab_hash[b] << a
end

que = [[1, 0]] # 各都市とその都市への距離をキューに格納します。

ways = Array.new(n + 1, 0) # 各都市に到達する方法の数
ways[1] = 1

arrived = Array.new(n + 1, -1) # 各都市への距離。未訪問の都市は-1。
arrived[1] = 0

while que.size.positive?
  now, d = que.shift
  d_plus = d + 1
  ab_hash[now]&.each do |next_num|
    if arrived[next_num] == -1 # 未訪問
      arrived[next_num] = d_plus
      ways[next_num] += ways[now]
      que << [next_num, d_plus]
    elsif arrived[next_num] == d_plus # 既に訪問したが、同じ距離で到達
      ways[next_num] += ways[now]
    end
  end
end

puts ways[n] % mod_num
