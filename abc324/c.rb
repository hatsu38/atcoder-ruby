=begin
## 問題文
高橋君は英小文字からなる文字列Tを青木君に向けて送りました。
その結果、青木君は英小文字からなる文字列T**′を受信しました。
T**′はTから一部が変更されてしまっている可能性があり、具体的には、下記の4つのうちのちょうど1つが成り立つことがわかっています。
T**′は、Tと等しい。
T**′は、Tのいずれか1つの位置（先頭と末尾も含む）に英小文字を1つ挿入して得られる文字列である。
T**′は、Tからある1文字を削除して得られる文字列である。
T**′は、Tのある1文字を別の英小文字に変更して得られる文字列である。
青木君が受信した文字列T**′と、英小文字からなるN個の文字列S1​,S2​,…,SN​が入力として与えられるので、S1​,S2​,…,SN​のうち、高橋君が送った文字列Tと等しい可能性があるものをすべて求めてください。

## 制約
N は整数
1≤N≤5×10**5
Si​ と T**′ は英小文字からなる長さ 1 以上 5×10**5 以下の文字列
S1​,S2​,…,SN​ の長さの総和は 5×10**5 以下

## 入力入力は以下の形式で標準入力から与えられる。
N T**′
S1​
S2​
⋮
SN​

## 出力S1​,S2​,…,SN​ のうち T と等しい可能性があるものすべての添字を昇順に並べた列を (i1​,i2​,…,iK​) とする。
この列の長さ K および列自体を、下記の形式にしたがって出力せよ。
K
i1​ i2​ … iK​

## 入力例 1
5 ababc
ababc
babc
abacbc
abdbc
abbac

## 出力例 1
4
1 2 3 4

S1​,S2​,…,S5​ のうち、T と等しい可能性があるものは S1​,S2​,S3​,S4​ の 4 つであることが下記の通りわかります。
S1​ は T と等しい可能性があります。なぜなら、T**′= ababc は S1​= ababc と等しいからです。
S2​ は T と等しい可能性があります。なぜなら、T**′= ababc は S2​= babc の先頭に文字 a を挿入して得られる文字列だからです。
S3​ は T と等しい可能性があります。なぜなら、T**′= ababc は S3​= abacbc から 4 文字目の c を削除して得られる文字列だからです。
S4​ は T と等しい可能性があります。なぜなら、T**′= ababc は S4​= abdbc の 3 文字目の d を b に変更して得られる文字列だからです。
S5​ は T と等しい可能性はありません。なぜなら、S5​= abbac を T としたとき、T**′= ababc は問題文中の 4 つの条件をいずれも満たさないからです。

## 入力例 2
1 aoki
takahashi

## 出力例 2
0

## 入力例 3
9 atcoder
atoder
atcode
athqcoder
atcoder
tacoder
jttcoder
atoder
atceoder
atcoer

## 出力例 3
6
1 2 4 7 8 9

=end

require 'prime'

def valid?(s, t)
  s_length = s.length
  t_length = t.length
  if s == t
    return true
  elsif s_length == t_length
    diff = 0
    s_length.times do |i|
      diff += 1 if s[i] != t[i]
      return false if diff > 1
    end
    return diff == 1
  elsif s_length == t_length - 1
    s_length.times do |i|
      return s[i..] == t[i + 1..] if s[i] != t[i]
    end
    return true
  elsif s_length == t_length + 1
    t.length.times do |i|
      return s[i + 1..] == t[i..] if s[i] != t[i]
    end
    return true
  end

  false
end

n, t_dash = gets.split
n = n.to_i

ans = []

n.times do |i|
  s = gets.chomp
  ans << (i + 1) if valid?(s, t_dash)
end

puts ans.size
puts ans.join(' ') unless ans.empty?
