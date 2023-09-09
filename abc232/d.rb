=begin
## 問題文
縦H行、横W行のH×Wマスからなるグリッドがあります。
上からi行目、左からj列目のマスを(i,j)と表します。
各マスの状態は文字Ci,j​で表され、Ci,j​=.ならばマス(i,j)は空きマスであり、Ci,j​=#ならばマス(i,j)は壁です。
高橋君がグリッド上を歩こうとしています。
彼がマス(i,j)にいるとき、マス(i,j+1)またはマス(i+1,j)に移動することができます。
ただし、グリッドの外に出るような移動や、壁のマスへの移動を行うことはできません。
高橋君は、移動することのできるマスが無くなった時点で立ち止まります。
高橋君がマス(1,1)から歩き始めるとき、彼が立ち止まるまでに通ることのできるマスは最大で何マスですか？

## 制約
1≤H,W≤100
H,W は整数
Ci,j​= . または Ci,j​= # (1≤i≤H,1≤j≤W)
C1,1​= .

## 入力入力は以下の形式で標準入力から与えられる。
H W
C1,1​…C1,W​
⋮
CH,1​…CH,W​

## 出力答えを出力せよ。

## 入力例 1
3 4
.#..
..#.
..##

## 出力例 1
4

例えば (1,1)→(2,1)→(2,2)→(3,2) と進むことで、4 マス通ることができます。
5 マス以上通ることはできないので、4 と出力します。

## 入力例 2
1 1
.

## 出力例 2
1

## 入力例 3
5 5
.....
.....
.....
.....
.....

## 出力例 3
9

=end

require 'prime'

h, w = gets.chomp.split.map(&:to_i)

c_ary = []

h.times do
  c_ary << gets.chomp.chars
end

que = [[0, 0]]

arrived = Array.new(h) { Array.new(w, false) }

ans = -1

while que.size.positive?
  y, x = que.shift
  current_point = y + x + 1

  ans = current_point if ans < current_point

  if y + 1 < h && c_ary[y + 1][x] == '.' && !arrived[y + 1][x]
    arrived[y + 1][x] = true
    que << [y + 1, x]
  end
  if x + 1 < w && c_ary[y][x + 1] == '.' && !arrived[y][x + 1]
    arrived[y][x + 1] = true
    que << [y, x + 1]
  end
end

puts ans
