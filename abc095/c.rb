=begin
## 問題文
ファーストフードチェーン「ピザアット」のメニューは「Aピザ」「Bピザ」「ABピザ」の3種類です。
AピザとBピザは全く異なるピザで、これらをそれぞれ半分に切って組み合わせたものがABピザです。
Aピザ、Bピザ、ABピザ1枚あたりの値段はそれぞれA円、B円、C円です。
中橋くんは、今夜のパーティーのためにAピザX枚とBピザY枚を用意する必要があります。
これらのピザを入手する方法は、AピザやBピザを直接買うか、ABピザ2枚を買ってAピザ1枚とBピザ1枚に組み替える以外にはありません。
このためには最小で何円が必要でしょうか？なお、ピザの組み替えにより、必要な量を超えたピザが発生しても構いません。

## 制約
1≤A,B,C≤5000
1≤X,Y≤10**5
入力中のすべての値は整数である。

## 入力入力は以下の形式で標準入力から与えられる。
A B C X Y

## 出力X 枚の A ピザと Y 枚の B ピザを用意するために必要な最小の金額を出力せよ。

## 入力例 1
1500 2000 1600 3 2

## 出力例 1
7900

AB ピザを 4 枚買って A ピザと B ピザ 2 枚ずつに組み替え、A ピザを 1 枚買い足すのが最適です。

## 入力例 2
1500 2000 1900 3 2

## 出力例 2
8500

A ピザ 3 枚と B ピザ 2 枚をそのまま買うのが最適です。

## 入力例 3
1500 2000 500 90000 100000

## 出力例 3
100000000

AB ピザを 200000 枚買って A ピザと B ピザ 100000 枚ずつに組み替えるのが最適です。
A ピザが 10000 枚余計にできますが、構いません。
=end

require 'prime'

@a, @b, @c, @x, @y = gets.split.map(&:to_i)

tmp_ans = (@a * @x) + (@b * @y)

(0..[@x, @y].max).each do |i|
  tmp_ans = [(@a * [(@x - i), 0].max) + (@b * [(@y - i), 0].max) + (@c * 2 * i), tmp_ans].min
end

puts tmp_ans
