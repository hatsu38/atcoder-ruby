=begin
## 問題文
整数A,B,C,Dが与えられます。
A以上B以下の整数のうち、CでもDでも割り切れないものの個数を求めてください。

## 制約
1≤A≤B≤10**18
1≤C,D≤10**9
入力はすべて整数である

## 入力入力は以下の形式で標準入力から与えられる。
A B C D

## 出力A 以上 B 以下の整数のうち、C でも D でも割り切れないものの個数を出力せよ。

## 入力例 1
4 9 2 3

## 出力例 1
2

5,7 が条件を満たします。

## 入力例 2
10 40 6 8

## 出力例 2
23

## 入力例 3
314159265358979323 846264338327950288 419716939 937510582

## 出力例 3
532105071133627368

=end

require 'prime'

a, b, c, d = gets.split.map(&:to_i)

b_c_rate = b / c
b_d_rate = b / d

lcm = c.lcm(d)
b_cd_rate = b / lcm

a_c_rate = (a - 1) / c
a_d_rate = (a - 1) / d
a_cd_rate = (a - 1) / lcm

tmp_minus = (a - 1) - (a_c_rate + a_d_rate - a_cd_rate)

dup_count = (b_c_rate + b_d_rate - b_cd_rate + tmp_minus)
puts b - dup_count
