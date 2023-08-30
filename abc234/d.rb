=begin
## 問題文
(1,2,…,N)の順列P=(P1​,P2​,…,PN​)、および正整数Kが与えられます。
i=K,K+1,…,Nについて、以下を求めてください。
Pの先頭i項のうち、K番目に大きい値

## 制約
1≤K≤N≤5×10**5
(P1​,P2​,…,PN​) は (1,2,…,N) の並び替えによって得られる
入力はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N K
P1​ P2​ … PN​

## 出力i=K,K+1,…,N についてこの順に、問題文中で問われている値を改行区切りで出力せよ。

## 入力例 1
3 2
1 2 3

## 出力例 1
1
2

P の先頭 2 項、すなわち (P1​,P2​)=(1,2) の中で K=2 番目に大きい値は 1 となります。
P の先頭 3 項、すなわち (P1​,P2​,P3​)=(1,2,3) の中で K=2 番目に大きい値は 2 となります。

## 入力例 2
11 5
3 7 2 5 11 6 1 9 8 10 4

## 出力例 2
2
3
3
5
6
7
7

=end

require 'prime'

n, k = gets.chomp.split.map(&:to_i)
p_ary = gets.chomp.split.map(&:to_i)

a = Hash.new(false)
p_ary[0, k].each { |x| a[x] = true }
x = p_ary[0, k].min
puts x

(k...n).each do |i|
  if p_ary[i] > x
    a[x] = false
    a[p_ary[i]] = true
  end
  x += 1 until a[x]
  puts x
end
