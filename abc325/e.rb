=begin
## 問題文
英小文字からなるN個の文字列S1​,S2​,…,SN​、および、英小文字からなる文字列Tが与えられます。
1以上N以下の2つの整数からなる組(i,j)はN**2個ありますが、そのうち下記の条件を満たすものの個数を出力してください。
Si​とSj​をこの順に連結して得られる文字列は、Tを（連続とは限らない）部分列として含む。

## 制約
N は整数
1≤N≤5×10**5
Si​ および T は英小文字からなる長さ 1 以上 5×10**5 以下の文字列
S1​,S2​,…,SN​ の長さの総和は 5×10**5 以下

## 入力入力は以下の形式で標準入力から与えられる。
N T
S1​
S2​
⋮
SN​

## 出力答えを出力せよ。

## 入力例 1
3 bac
abba
bcb
aaca

## 出力例 1
3

問題文中の条件を満たす組 (i,j) は、下記に示す 3 個の組 (1,2),(1,3),(2,3) です。
(i,j)=(1,2) について、S1​ と S2​ をこの順に連結して得られる文字列 abbabcb は bac を部分列として含みます。
(i,j)=(1,3) について、S1​ と S3​ をこの順に連結して得られる文字列 abbaaaca は bac を部分列として含みます。
(i,j)=(2,3) について、S2​ と S3​ をこの順に連結して得られる文字列 bcbaaca は bac を部分列として含みます。

## 入力例 2
5 xx
x
x
x
x
x

## 出力例 2
25

## 入力例 3
1 y
x

## 出力例 3
0

## 入力例 4
10 ms
mkgn
m
hlms
vmsle
mxsm
nnzdhi
umsavxlb
ffnsybomr
yvmm
naouel

## 出力例 4
68

=end

require 'prime'

def prefix(s, t)
  j = 0
  s.each_with_index { |a, _i| j += 1 if a == t[j] }
  j
end

def suffix(s, t)
  j = t.size - 1
  i = s.size
  while (i -= 1) >= 0
    j -= 1 if s[i] == t[j]
  end
  j
end

N, T = gets.chomp.split.then { |n, t| [n.to_i, t.bytes] }
S = Array.new(N) { gets.chomp.bytes }
suffixes = S.map { |s| suffix(s, T) }.sort!
ans = 0
S.each do |s|
  j = prefix(s, T)
  ans += suffixes.bsearch_index { |i| i >= j } || N
end
puts ans
