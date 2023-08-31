=begin
## 問題文
筋力をつけたい高橋君は、AtCoder社のトレーニング設備で、トレーニングをすることにしました。
AtCoder社のトレーニング設備にはN個のボタンがついており、ちょうど1個のボタンが光っています。
ボタンには、1からNまでの番号がついています。
ボタンiが光っているときにそのボタンを押すと、ボタンiの明かりが消え、その後ボタンai​が光ります。
i=ai​であることもあります。
光っていないボタンを押しても、何も起こりません。
最初、ボタン1が光っています。
高橋君は、ボタン2が光っている状態で、トレーニングをやめたいと思っています。
そのようなことは可能かどうか判定し、もし可能なら最低で何回ボタンを押す必要があるかを求めてください。

## 制約
2≦N≦10**5
1≦ai​≦N

## 入力入力は以下の形式で標準入力から与えられる。
N
a1​
a2​
:
aN​

## 出力ボタン 2 を光らせることが不可能な場合、−1 を出力せよ。
そうでない場合、ボタン 2 を光らせるために必要なボタンを押す回数の最小値を出力せよ。

## 入力例 1
3
3
1
2

## 出力例 1
2

ボタン 1,3 の順に押せばよいです。

## 入力例 2
4
3
4
1
2

## 出力例 2
-1

ボタン 1 を押すとボタン 3 、ボタン 3 を押すとボタン 1 が光るので、ボタン 2 が光ることはありません。

## 入力例 3
5
3
3
4
2
4

## 出力例 3
3

=end

require 'prime'

n = gets.to_i

a_index_hash = {}

n.times do |i|
  a_index_hash[i] = gets.to_i
end

index = 0
count = 0
arrived_index_hash = {}
bool = true

while bool
  if arrived_index_hash[index]
    puts(-1)
    bool = false
    exit
  end
  count += 1
  arrived_index_hash[index] = true
  index = a_index_hash[index] - 1
  bool = false if index == 1
end

puts count
