=begin
## 問題文
英小文字のみからなるN個の文字列S1​,S2​,…,SN​が与えられます。
S1​,S2​,…,SN​から文字列を好きな個数選ぶことを考えます。
このとき、「選んだ文字列の中でちょうどK個の文字列に登場する英小文字」の種類数としてあり得る最大値を求めてください。

## 制約
1≤N≤15
1≤K≤N
N,K は整数
Si​ は英小文字からなる空でない文字列である。
1≤i≤N を満たす整数 i に対し、Si​ に同じ文字は 2 個以上含まれない。
i≠j ならば Si​≠Sj​ である。

## 入力入力は以下の形式で標準入力から与えられる。
N K
S1​
S2​
⋮
SN​

## 出力答えを出力せよ。

## 入力例 1
4 2
abi
aef
bc
acg

## 出力例 1
3

S1​,S3​,S4​ を選んだ場合、a,b,c がちょうど 2 個の文字列に含まれます。
4 個以上の文字がちょうど 2 個の文字列に含まれるような選び方は存在しないため、答えは 3 です。

## 入力例 2
2 2
a
b

## 出力例 2
0

同じ文字列を複数回選ぶことはできません。

## 入力例 3
5 2
abpqxyz
az
pq
bc
cy

## 出力例 3
7

=end

require 'prime'

n, k = gets.chomp.split.map(&:to_i)

s_ary = []
n.times do
  s_ary << gets.chomp.chars
end

ans = 0

[0, 1].repeated_permutation(n) do |bits|
  s = []
  bits.each_with_index do |bit, i|
    s << s_ary[i] if bit == 1
  end
  count_hash = s.flatten.tally
  cnt = 0
  count_hash.each do |_, v|
    cnt += 1 if v == k
  end
  ans = [ans, cnt].max
end

puts ans
