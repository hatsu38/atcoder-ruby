=begin
## 問題文
N人の人1,2,…,Nがある試験を受け、人iはAi​点を取りました。
この試験では、L点以上を取った人のみが合格となります。
N人のうち何人が合格したか求めてください。

## 制約
入力は全て整数
1≤N≤100
1≤L≤1000
0≤Ai​≤1000

## 入力入力は以下の形式で標準入力から与えられる。
N L
A1​ A2​ … AN​

## 出力答えを整数として出力せよ。

## 入力例 1
5 60
60 20 100 90 40

## 出力例 1
3

5 人が試験を受けました。 60 点以上取ると合格です。
人 1 は 60 点を取ったので、合格です。
人 2 は 20 点を取ったので、不合格です。
人 3 は 100 点を取ったので、合格です。
人 4 は 90 点を取ったので、合格です。
人 5 は 40 点を取ったので、不合格です。
以上より、合格したのは 3 人だと分かります。

## 入力例 2
4 80
79 78 77 76

## 出力例 2
0

合格者がいない場合もあります。

## 入力例 3
10 50
31 41 59 26 53 58 97 93 23 84

## 出力例 3
6

=end

require 'prime'

_, l = gets.chomp.split.map(&:to_i)
a_ary = gets.chomp.split.map(&:to_i)

puts a_ary.count { _1 >= l }
