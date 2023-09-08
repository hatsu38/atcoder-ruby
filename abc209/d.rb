=begin
## 問題文
高橋王国はN個の街とN−1本の道路からなり、街には1からNの番号がついています。
また、i(1≤i≤N−1)本目の道路は街ai​と街bi​を双方向に結んでおり、どの街からどの街へもいくつかの道路を通ることで移動できます。
道路は全て同じ長さです。
Q個のクエリが与えられます。
i(1≤i≤Q)番目のクエリでは整数ci​,di​が与えられるので、以下の問題を解いてください。
現在高橋君は街ci​に、青木君は街di​にいる。
二人が同時に街を出発し、それぞれ街di​,ci​を目指して同じ速さで移動するとき、二人が街で出会うか道路上（両端の街を除く）で出会うかを判定せよ。
ただし、二人とも最短経路で移動し、街の中を移動する時間は無視できるものとする。

## 制約
2≤N≤10**5
1≤Q≤10**5
1≤ai​<bi​≤N(1≤i≤N−1)
1≤ci​<di​≤N(1≤i≤Q)
入力は全て整数
どの街からどの街へもいくつかの道路を通ることで移動できる

## 入力入力は以下の形式で標準入力から与えられる。
N Q
a1​ b1​
a2​ b2​
⋮
aN−1​ bN−1​
c1​ d1​
c2​ d2​
⋮
cQ​ dQ​

## 出力Q 行出力せよ。
i(1≤i≤Q) 行目には、i 番目のクエリにおいて二人が街で出会うなら Town、道路上で出会うなら Road と出力せよ。

## 入力例 1
4 1
1 2
2 3
2 4
1 2

## 出力例 1
Road

1 番目のクエリでは、高橋君は街 1、青木君は街 2 を同時に出発し、1 本目の道路上で出会います。よって Road と出力してください。

## 入力例 2
5 2
1 2
2 3
3 4
4 5
1 3
1 5

## 出力例 2
Town
Town

1 番目のクエリでは、高橋君は街 1、青木君は街 3 を同時に出発し、街 2 で出会います。よって Town と出力してください。
2 番目のクエリでは、高橋君は街 1、青木君は街 5 を同時に出発し、街 3 で出会います。よって Town と出力してください。

## 入力例 3
9 9
2 3
5 6
4 8
8 9
4 5
3 4
1 9
3 7
7 9
2 5
2 6
4 6
2 4
5 8
7 8
3 6
5 6

## 出力例 3
Town
Road
Town
Town
Town
Town
Road
Road
Road

=end

require 'prime'

n, q = gets.split.map(&:to_i)
graph = Array.new(n) { [] }

(n - 1).times do
  a, b = gets.split.map(&:to_i)
  graph[a - 1] << (b - 1)
  graph[b - 1] << (a - 1)
end

cost = [Float::INFINITY] * n
q.times do |i|
  s, g = gets.split.map { |val| val.to_i - 1 }
  if i.zero?
    cost[s] = 0
    que = [s]
    while (now = que.shift)
      graph[now].each do |nxt|
        if cost[now] + 1 < cost[nxt]
          cost[nxt] = cost[now] + 1
          que << nxt
        end
      end
    end
  end
  ans = (cost[s] - cost[g]).even? ? 'Town' : 'Road'
  puts ans
end
