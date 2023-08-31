=begin
## 問題文
高橋君は数直線上の座標0の位置にいます。
これから高橋君はN回のジャンプを行います。
i(1≤i≤N)回目のジャンプでは、正の方向にai​またはbi​移動します。
N回のジャンプの後に座標Xの位置にいるようにすることはできますか？

## 制約
1≤N≤100
1≤ai​<bi​≤100(1≤i≤N)
1≤X≤10000
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N X
a1​ b1​
⋮
aN​ bN​

## 出力N 回のジャンプの後に座標 X の位置にいるようにすることができるならば Yes と、そうでないなら No と出力せよ。

## 入力例 1
2 10
3 6
4 5

## 出力例 1
Yes

1 回目のジャンプでは b1​(=6) 移動し、2 回目のジャンプでは a2​(=4) 移動することで、座標 X(=10) の位置にいるようにすることができます。

## 入力例 2
2 10
10 100
10 100

## 出力例 2
No

1 回目のジャンプの後に座標 X(=10) の位置にいるようにすることはできますが、全てのジャンプの後に座標 X(=10) の位置にいるようにすることはできません。

## 入力例 3
4 12
1 8
5 7
3 4
2 6

## 出力例 3
Yes

=end

require 'prime'

n, x = gets.split.map(&:to_i)

a_index_hash = {}
b_index_hash = {}
n.times do |i|
  ai, bi = gets.split.map(&:to_i)
  a_index_hash[i] = ai
  b_index_hash[i] = bi
end

dp = Array.new(n + 1) { Array.new(x + 1, false) }

dp[0][0] = true

n.times do |i|
  (x + 1).times do |j|
    if dp[i][j]
      dp[i + 1][j + a_index_hash[i]] = true
      dp[i + 1][j + b_index_hash[i]] = true
    end
  end
end

puts dp[n][x] ? 'Yes' : 'No'
