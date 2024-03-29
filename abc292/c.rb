=begin
## 問題文
正整数Nが与えられます。
正整数の組(A,B,C,D)であって、AB+CD=Nを満たすものの個数を求めてください。
なお、本問の制約の下、答えが9×10**18以下であることが証明できます。

## 制約
2≤N≤2×10**5
N は整数

## 入力入力は以下の形式で標準入力から与えられる。
N

## 出力答えを出力せよ。

## 入力例 1
4

## 出力例 1
8

(A,B,C,D) として以下の 8 個が考えられます。
(A,B,C,D)=(1,1,1,3)
(A,B,C,D)=(1,1,3,1)
(A,B,C,D)=(1,2,1,2)
(A,B,C,D)=(1,2,2,1)
(A,B,C,D)=(1,3,1,1)
(A,B,C,D)=(2,1,1,2)
(A,B,C,D)=(2,1,2,1)
(A,B,C,D)=(3,1,1,1)

## 入力例 2
292

## 出力例 2
10886

## 入力例 3
19876

## 出力例 3
2219958

=end

require 'prime'

n = gets.to_i

f = Array.new(n + 1, 0)

(1..n).each do |a|
  (1..n / a).each do |b|
    f[a * b] += 1
  end
end

ans = 0
(1..n).each do |c|
  ans += f[c] * f[n - c]
end

puts ans
