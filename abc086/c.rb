=begin
## 問題文
シカのAtCoDeerくんは二次元平面上で旅行をしようとしています。
AtCoDeerくんの旅行プランでは、時刻0に点(0,0)を出発し、1以上N以下の各iに対し、時刻ti​に点(xi​,yi​)を訪れる予定です。
AtCoDeerくんが時刻tに点(x,y)にいる時、時刻t+1には点(x+1,y),(x−1,y),(x,y+1),(x,y−1)のうちいずれかに存在することができます。
その場にとどまることは出来ないことに注意してください。
AtCoDeerくんの旅行プランが実行可能かどうか判定してください。

## 制約
1 ≤ N ≤ 10**5
0 ≤ xi​ ≤ 10**5
0 ≤ yi​ ≤ 10**5
1 ≤ ti​ ≤ 10**5
ti​ < ti+1​ (1 ≤ i ≤ N−1)
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N
t1​ x1​ y1​
t2​ x2​ y2​
:
tN​ xN​ yN​

## 出力旅行プランが実行可能ならYesを、不可能ならNoを出力してください。

## 入力例 1
2
3 1 2
6 1 1

## 出力例 1
Yes

例えば、(0,0), (0,1), (1,1), (1,2), (1,1), (1,0), (1,1) と移動すればよいです。

## 入力例 2
1
2 100 100

## 出力例 2
No

(0,0) にいる状態から 2 秒後に (100,100) にいるのは不可能です。

## 入力例 3
2
5 1 1
100 1 1

## 出力例 3
No

=end

require 'prime'

n = gets.to_i

txy_array = Array.new(n) { gets.split.map(&:to_i) }

default_x = 0
default_y = 0

default_time = 0

n.times do |i|
  t, x, y = txy_array[i]
  time = t - default_time
  distance = (x - default_x).abs + (y - default_y).abs
  if time < distance
    puts 'No'
    exit
  elsif (time - distance).odd?
    puts 'No'
    exit
  end
  default_x = x
  default_y = y
  default_time = t
end

puts 'Yes'
