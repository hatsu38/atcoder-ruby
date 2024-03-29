=begin
## 問題文
座標平面上にN枚の長方形のシートが張られています。
各シートが覆う長方形領域の各辺はそれぞれx軸またはy軸と平行であり、具体的には、i枚目のシートはちょうどAi​≤x≤Bi​かつCi​≤y≤Di​をみたす領域全体を覆っています。
1枚以上のシートによって覆われている領域の面積をSとすると、Sは制約の条件下で整数となる事が証明できます。
Sを整数の形で出力してください。

## 制約
2≤N≤100
0≤Ai​<Bi​≤100
0≤Ci​<Di​≤100
入力はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N
A1​ B1​ C1​ D1​
A2​ B2​ C2​ D2​
⋮
AN​ BN​ CN​ DN​

## 出力1 枚以上のシートによって覆われている領域の面積 S を整数で出力せよ。

## 入力例 1
3
0 5 1 3
1 4 0 5
2 5 2 4

## 出力例 1
20

3 枚のシートによって覆われている領域は次のようになります。
ここで、赤色・黄色・青色はそれぞれ 1 枚目・ 2 枚目・ 3 枚目のシートによって覆われている領域を表しています。
よって、1 枚以上のシートによって覆われている領域の面積は S=20 となります。

## 入力例 2
2
0 100 0 100
0 100 0 100

## 出力例 2
10000

異なるシートが同じ領域を覆っている事があることに注意してください。

## 入力例 3
3
0 1 0 1
0 3 0 5
5 10 0 10

## 出力例 3
65

=end

require 'prime'

n = gets.chomp.to_i
abcd_ary = Array.new(n) { gets.chomp.split.map(&:to_i) }

ans = 0
101.times do |x|
  101.times do |y|
    cnt = 0
    abcd_ary.each do |a, b, c, d|
      cnt += 1 if a <= x && x < b && c <= y && y < d
    end
    ans += 1 if cnt >= 1
  end
end

puts ans
