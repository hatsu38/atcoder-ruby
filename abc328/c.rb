=begin
## 問題文
英小文字のみからなる長さNの文字列S=S1​S2​…SN​が与えられます。
また、Sに関するQ個の質問が与えられます。
i=1,2,…,Qについて、i番目の質問は2つの整数li​,ri​で表される下記の質問です。
Sのli​文字目からri​文字目までからなる部分文字列Sli​​Sli​+1​…Sri​​において、同じ英小文字が2つ隣りあう箇所は何個ありますか？すなわち、li​≤p≤ri​−1かつSp​=Sp+1​を満たす整数pは何個ありますか？Q個の質問それぞれの答えを出力してください。

## 制約
N,Q は整数
1≤N,Q≤3×10**5
S は英小文字のみからなる長さ N の文字列
li​,ri​ は整数
1≤li​≤ri​≤N

## 入力入力は以下の形式で標準入力から与えられる。
N Q
S
l1​ r1​
l2​ r2​
⋮
lQ​ rQ​

## 出力Q 行出力せよ。
i=1,2,…,Q について、i 行目には i 番目の質問に対する答えを出力せよ。

## 入力例 1
11 4
mississippi
3 9
4 10
4 6
7 7

## 出力例 1
2
2
0
0

4 個の質問それぞれに対する答えは下記の通りです。
1 個目の質問に関して、S3​S4​…S9​= ssissip で同じ英小文字が隣り合う箇所は、S3​S4​= ss と S6​S7​= ss の 2 個です。
2 個目の質問に関して、S4​S5​…S10​= sissipp で同じ英小文字が隣り合う箇所は、S6​S7​= ss と S9​S10​= pp の 2 個です。
3 個目の質問に関して、S4​S5​S6​= sis で同じ英小文字が隣り合う箇所は 0 個です。
4 個目の質問に関して、S7​= s で同じ英小文字が隣り合う箇所は 0 個です。

## 入力例 2
5 1
aaaaa
1 5

## 出力例 2
4

S1​S2​…S5​= aaaaa で同じ英小文字が隣り合う箇所は、
S1​S2​= aa 、S2​S3​= aa 、S3​S4​= aa 、S4​S5​= aa の 4 個です。

=end

require 'prime'

_, q = gets.split.map(&:to_i)
s = gets.chomp.chars

cumulative = [0]
s.each_cons(2).with_index do |(a, b), i|
  cumulative << (cumulative[i] + (a == b ? 1 : 0))
end

q.times do
  l, r = gets.split.map(&:to_i)
  puts cumulative[r - 1] - cumulative[l - 1]
end
