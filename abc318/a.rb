=begin
## 問題文
高橋くんは満月が好きです。
今日を1日目とすると、今日以降で満月を見られる最初の日はM日目です。
以後はP日ごと、つまりM+P日目、M+2P日目、…に満月を見られます。
1日目からN日目まで（両端を含む）の中で、高橋くんが満月を見られる日の数を求めてください。

## 制約
1≤N≤2×10**5
1≤M≤P≤2×10**5
入力される数値は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N M P

## 出力答えを整数として出力せよ。

## 入力例 1
13 3 5

## 出力例 1
3

満月を見られる日は、3 日目、8 日目、13 日目、18 日目、… です。
1 日目から 13 日目までの中で高橋くんが満月を見られる日は、3 日目、8 日目、13 日目の 3 個です。

## 入力例 2
5 6 6

## 出力例 2
0

高橋くんが満月を見られる日が存在しない場合もあります。

## 入力例 3
200000 314 318

## 出力例 3
628

=end

require 'prime'

n, m, p = gets.chomp.split.map(&:to_i)

cnt = m
ans = 0
while cnt <= n do
  ans += 1 if cnt <= n
  cnt += p
end

puts ans