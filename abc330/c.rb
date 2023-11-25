=begin
## 問題文
正整数Dが与えられます。
非負整数x,yに対する∣x**2+y**2−D∣の最小値を求めてください。

## 制約
1≤D≤2×10**12
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
D

## 出力答えを出力せよ。

## 入力例 1
21

## 出力例 1
1

x=4,y=2 のとき ∣x**2+y**2−D∣=∣16+4−21∣=1 となります。
∣x**2+y**2−D∣=0 を満たすような非負整数 x,y は存在しないので、答えは 1 です。

## 入力例 2
998244353

## 出力例 2
0

## 入力例 3
264428617

## 出力例 3
32

=end

require 'prime'

d = gets.chomp.to_i

min_diff = Float::INFINITY

x = 0
while x * x <= d
  y2 = d - (x * x)
  y = Math.sqrt(y2).to_i

  [y, y + 1].each do |yy|
    diff = ((x * x) + (yy * yy) - d).abs
    min_diff = [min_diff, diff].min
  end

  x += 1
end

puts min_diff
