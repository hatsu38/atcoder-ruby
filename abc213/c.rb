=begin

H行W列の格子状にHW枚のカードが並べられています。
i=1,…,Nについて、上からAi​行目、左からBi​列目にあるカードには数iが書かれており、それ以外のHW−N枚のカードには何も書かれていません。
これらのカードに対し、以下の2種類の操作を可能な限り繰り返します。
数の書かれたカードを含まない行が存在するとき、その行のカードを全て取り除き、残りのカードを上へ詰める数の書かれたカードを含まない列が存在するとき、その列のカードを全て取り除き、残りのカードを左へ詰める操作が終了したとき、数が書かれたカードがそれぞれどこにあるか求めてください。
なお、答えは操作の仕方に依らず一意に定まることが証明されます。

制約
1≤H,W≤10**9
1≤N≤min(10**5,HW)
1≤Ai​≤H
1≤Bi​≤W
(Ai​,Bi​) は相異なる
入力に含まれる値は全て整数である

入力入力は以下の形式で標準入力から与えられる。
H W N
A1​ B1​
⋮
AN​ BN​

出力
N 行出力せよ。
操作終了後に数 i が書かれたカードが上から Ci​ 行目、左から Di​ 列目に存在するとき、i 行目には Ci​,Di​ をこの順に空白区切りで出力せよ。

入力例 1
4 5 2
3 2
2 5

出力例 1
2 1
1 2

何も書かれていないカードを * で表すことにします。最初、カードの配置は以下の通りです。
*****
****2
*1***
*****

操作終了後、カードの配置は以下の通りになります。
*2
1*

1 が書かれたカードは上から 2 行目、左から 1 列目にあり、2 が書かれたカードは上から 1 行目、左から 2 列目にあります。

入力例 2
1000000000 1000000000 10
1 1
10 10
100 100
1000 1000
10000 10000
100000 100000
1000000 1000000
10000000 10000000
100000000 100000000
1000000000 1000000000

出力例 2
1 1
2 2
3 3
4 4
5 5
6 6
7 7
8 8
9 9
10 10

=end

require 'prime'

_, _, n = gets.split.map(&:to_i)
a_ary = []
b_ary = []

n.times do |_i|
  a, b = gets.split.map(&:to_i)
  a_ary << a
  b_ary << b
end

a_hash = a_ary.uniq.sort.each.with_index(1).to_h
b_hash = b_ary.uniq.sort.each.with_index(1).to_h

n.times do |i|
  puts "#{a_hash[a_ary[i]]} #{b_hash[b_ary[i]]}"
end
