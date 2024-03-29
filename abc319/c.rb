=begin
## 問題文
3×3のマス目に1から9までの数字が書き込まれており、上からi行目、左からj列目(1≤i≤3,1≤j≤3)に書き込まれている数字はci,j​です。
異なるマスに同じ数字が書き込まれている場合もありますが、同じ数字が縦・横・斜めに3つ連続して書き込まれていることはありません。
より厳密には、ci,j​について次の条件のすべてが成り立っていることが保証されます。
どの1≤i≤3についても、ci,1​=ci,2​=ci,3​ではないどの1≤j≤3についても、c1,j​=c2,j​=c3,j​ではないc1,1​=c2,2​=c3,3​ではないc3,1​=c2,2​=c1,3​ではない高橋くんは、それぞれのマスに書かれている数字をランダムな順番で知ります。
高橋くんは、縦・横・斜めの列のうちの1つでも次の条件を満たしたときがっかりします。
はじめに知ったほうの2マスに書かれた数字が同じであり、最後に知ったマスに書かれた数字がそれと異なる。
高橋くんががっかりせずにすべてのマスに書かれた数字を知る確率を求めてください。

## 制約
ci,j​∈{1,2,3,4,5,6,7,8,9} (1≤i≤3,1≤j≤3)
ci,1​=ci,2​=ci,3​ ではない (1≤i≤3)
c1,j​=c2,j​=c3,j​ ではない (1≤j≤3)
c1,1​=c2,2​=c3,3​ ではない
c1,3​=c2,2​=c3,1​ ではない

## 入力入力は以下の形式で標準入力から与えられる。
c1,1​ c1,2​ c1,3​
c2,1​ c2,2​ c2,3​
c3,1​ c3,2​ c3,3​

## 出力高橋くんががっかりせずにすべてのマスに書かれた数字を知る確率を 1 行で出力せよ。
真の値からの絶対誤差が 10**−8 以下であるとき、正答と判定される。

## 入力例 1
3 1 9
2 5 6
2 7 1

## 出力例 1
0.666666666666666666666666666667

例えば、高橋くんが c3,1​=2,c2,1​=2,c1,1​=3 の順に知った場合、高橋くんはがっかりしてしまいます。
対して、高橋くんが c1,1​,c1,2​,c1,3​,c2,1​,c2,2​,c2,3​,c3,1​,c3,2​,c3,3​ の順に数字を知った場合、がっかりすることなくすべての数字を知ることができます。
高橋くんががっかりすることなくすべての数字を知ることができる確率は 32​ です。
絶対誤差が 10**−8 以下であれば正答と判定されるため、0.666666657 や 0.666666676 のように出力しても正解になります。

## 入力例 2
7 7 6
8 6 8
7 7 6

## 出力例 2
0.004982363315696649029982363316

## 入力例 3
3 6 7
1 9 7
5 7 5

## 出力例 3
0.4

=end

require 'prime'

grid = Array.new(3) { gets.split.map!(&:to_i) }.flatten

data = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].map do |i, j, k|
  if grid[i] == grid[j]
    [i, j, k]
  elsif grid[i] == grid[k]
    [k, i, j]
  elsif grid[j] == grid[k]
    [j, k, i]
  end
end
data.compact!

puts "data: #{data}"

cnt = [*0...9].permutation.count do |a|
  data.all? do |i, j, k|
    !(a[i] < a[k] && a[j] < a[k])
  end
end

puts cnt.fdiv(362_880)
