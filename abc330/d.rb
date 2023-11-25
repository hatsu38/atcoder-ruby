=begin
## 問題文
N×Nのマス目が与えられます。
このうち上からi行目、左からj列目のマスを(i,j)と書きます。
各マスの状態を表すN個の長さNの文字列S1​,S2​,…,SN​が以下の形式で与えられます。
Si​のj文字目がoであるとき、(i,j)にはoが書かれている。
Si​のj文字目がxであるとき、(i,j)にはxが書かれている。
以下の条件を全て満たすマスの三つ組の個数を求めてください。
組に含まれる3マスは相異なる。
3マス全てにoが書かれている。
マスのうち、丁度2つが同じ行にある。
マスのうち、丁度2つが同じ列にある。
但し、ふたつの三つ組は、丁度一方に含まれるマスが存在する場合のみ区別します。

## 制約
N は 2 以上 2000 以下の整数
Si​ は長さ N の o と x からなる文字列

## 入力入力は以下の形式で標準入力から与えられる。
N
S1​
S2​
⋮
SN​

## 出力答えを整数として出力せよ。

## 入力例 1
3
ooo
oxx
xxo

## 出力例 1
4

以下の 4 つの三つ組が条件を満たします。
(1,1),(1,2),(2,1)
(1,1),(1,3),(2,1)
(1,1),(1,3),(3,3)
(1,2),(1,3),(3,3)

## 入力例 2
4
oxxx
xoxx
xxox
xxxo

## 出力例 2
0

## 入力例 3
15
xooxxooooxxxoox
oxxoxoxxxoxoxxo
oxxoxoxxxoxoxxx
ooooxooooxxoxxx
oxxoxoxxxoxoxxx
oxxoxoxxxoxoxxo
oxxoxooooxxxoox
xxxxxxxxxxxxxxx
xooxxxooxxxooox
oxxoxoxxoxoxxxo
xxxoxxxxoxoxxoo
xooxxxooxxoxoxo
xxxoxxxxoxooxxo
oxxoxoxxoxoxxxo
xooxxxooxxxooox

## 出力例 3
2960

=end

require 'prime'

n = gets.chomp.to_i
s_ary = Array.new(n) { gets.chomp }

row_counts = Array.new(n, 0)
col_counts = Array.new(n, 0)

n.times do |i|
  n.times do |j|
    if s_ary[i][j] == 'o'
      row_counts[i] += 1
      col_counts[j] += 1
    end
  end
end

count = 0
n.times do |i|
  n.times do |j|
    next unless s_ary[i][j] == 'o'

    count += (row_counts[i] - 1) * (col_counts[j] - 1)
  end
end

puts count
