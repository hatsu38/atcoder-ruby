=begin
## 問題文
非負整数nが次の条件を満たすとき、nを良い整数と呼びます。
nを10進法で表したときに、偶数の数字(0,2,4,6,8)のみが登場する。
例えば0、68および2024は良い整数です。
整数Nが与えられます。
良い整数のうち小さい方からN番目の整数を求めてください。

## 制約
1≤N≤10**12
N は整数

## 入力入力は以下の形式で標準入力から与えられる。
N

## 出力小さい方から N 番目の良い整数を出力せよ。

## 入力例 1
8

## 出力例 1
24

良い整数を小さい方から順に並べると 0,2,4,6,8,20,22,24,26,28,… となります。
小さい方から 8 番目の良い整数は 24 なので、これを出力します。

## 入力例 2
133

## 出力例 2
2024

## 入力例 3
31415926535

## 出力例 3
2006628868244228

=end

require 'prime'

N = gets.to_i
quinary_num = (N - 1).to_s(5)
good_num = quinary_num.chars.map { |digit| digit.to_i * 2 }.join

puts good_num.to_i