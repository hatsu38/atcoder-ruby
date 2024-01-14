=begin
あなたは、N個の正整数A1​,A2​,⋯,AN​からなる数列Aを持っています。
あなたは、これから以下の操作をQ回、続けて行います。
i回目の操作では、値がBi​である要素すべてをCi​に置き換えます。
すべてのi(1≤i≤Q)に対して、i回目の操作が行われた後の数列Aのすべての要素の和、Si​を求めてください。

制約
入力は全て整数
1≤N,Q,Ai​,Bi​,Ci​≤10**5
Bi​=Ci​

入力入力は以下の形式で標準入力から与えられる。
N
A1​ A2​ ⋯ AN​
Q
B1​ C1​
B2​ C2​
⋮
BQ​ CQ​

出力Q 個の整数 Si​ を以下の形式で標準出力に出力せよ。
S1​
S2​
⋮
SQ​

Si​ は 32 ビット整数に収まらない可能性があることに注意せよ。

入力例 1
4
1 2 3 4
3
1 2
3 4
2 4

出力例 1
11
12
16

はじめ、数列 A は 1,2,3,4 です。
各操作後、 数列 A は以下のようになります。
2,2,3,4
2,2,4,4
4,4,4,4

入力例 2
4
1 1 1 1
3
1 2
2 1
3 5

出力例 2
8
4
4

数列 A に 要素の値が Bi​ であるものが 1 つも含まれていない可能性もあることに注意してください。

入力例 3
2
1 2
3
1 100
2 100
100 1000

出力例 3
102
200
2000

=end

require 'prime'

gets.chomp.to_i
a_ary = gets.split.map(&:to_i)
q = gets.chomp.to_i
bc_hash = {}
q.times do |i|
  b, c = gets.split.map(&:to_i)
  bc_hash[i] = {
    b: b,
    c: c
  }
end

default_sum = a_ary.sum

a_hash = {}

a_ary.each do |a|
  if a_hash[a]
    a_hash[a] += 1
  else
    a_hash[a] = 1
  end
end

bc_hash.each_value do |v|
  b = v[:b]
  c = v[:c]
  if a_hash[b]
    default_sum += (c - b) * a_hash[b]
    if a_hash[c]
      a_hash[c] += a_hash[b]
    else
      a_hash[c] = a_hash[b]
    end
    a_hash[b] = 0
  end
  puts default_sum
end
