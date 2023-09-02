=begin
## 問題文
高橋君はN日間の鉄道旅行を計画しています。
高橋君はそれぞれの日について、運賃の通常料金を払うか、1日周遊パスを1枚使用するか選ぶことができます。
ここで、1≤i≤Nについて、i日目の旅行にかかる運賃の通常料金はFi​円です。
一方、1日周遊パスはD枚セットでP円で発売されており、何セットでも購入することが可能ですが、D枚単位でしか購入することができません。
また、購入したパスは1枚ずつ好きな日に使うことができ、旅行が終了した時点で余っていても構いません。
N日間の旅行でかかる金額、すなわち1日周遊パスの購入にかかった代金と、1日周遊パスを利用しなかった日における運賃の通常料金の合計金額の和としてあり得る最小値を求めてください。

## 制約
1≤N≤2×10**5
1≤D≤2×10**5
1≤P≤10**9
1≤Fi​≤10**9
入力はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N D P
F1​ F2​ … FN​

## 出力N 日間の旅行でかかる金額としてあり得る最小値を出力せよ。

## 入力例 1
5 2 10
7 1 6 3 6

## 出力例 1
20

1 日周遊パスを 1 セットだけ購入し、1 日目と 3 日目に使用すると、合計金額は (10×1)+(0+1+0+3+6)=20 となり、このときかかる金額が最小となります。
よって、20 を出力します。

## 入力例 2
3 1 10
1 2 3

## 出力例 2
6

3 日間すべてにおいて運賃の通常料金を支払ったときに最小となります。

## 入力例 3
8 3 1000000000
1000000000 1000000000 1000000000 1000000000 1000000000 1000000000 1000000000 1000000000

## 出力例 3
3000000000

1 日周遊パスを 3 セット購入し、8 日間すべてにおいて 1 日周遊パスを利用したときに最小となります。
答えが 32 bit 整数型に収まらないことがあることに注意してください。

=end

require 'prime'

_, d, p = gets.chomp.split.map(&:to_i)

f_ary = gets.chomp.split.map(&:to_i).sort.reverse

ans = 0

f_ary.each_slice(d) do |f|
  f_sum = f.sum
  ans += [f_sum, p].min
end

puts ans
