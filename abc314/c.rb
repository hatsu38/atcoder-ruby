=begin
英小文字からなる長さ
N の文字列
S が与えられます。
S の各文字は色1 、色2 、… 、色M のM 色のうちのいずれかで塗られており、
i=1,2,…,N について、S のi 文字目は色
Ciで塗られています。
各i=1,2,…,M について、この順番に下記の操作を行います。

S の色i で塗られた文字からなる部分を、右に1 つ巡回シフトする。
すなわち、S の 色i で塗られた文字の位置が先頭のものから順に
p1,p2,p3,…,pk文字目であるとき、S の
p1,p2,p3,…,pk文字目を、それぞれ、
S のpk,p1,p2,…,pk−1文字目で同時に置き換える。
上記の操作をすべて行った後の、最終的なS を出力してください。

なお、M 色あるどの色についても、その色で塗られた
S の文字が必ず1 つ以上存在することが、制約として保証されます。

制約
1≤M≤N≤2×10 ** 5
1≤Ci≤M
N,M,Ciはすべて整数
S は英小文字からなる長さN の文字列
任意の整数1≤i≤M に対して、ある整数1≤j≤N が存在して
Cj=i が成り立つ

# input
8 3
apzbqrcs
1 2 3 1 2 2 1 2

# output
cszapqbr

# input
2 1
aa
1 1

# output
aa

=end

require 'prime'

N, M = gets.chomp.split.map(&:to_i)

S = gets.chomp
C_ARY = gets.chomp.split.map(&:to_i)

S_HASH = {}
S.each_char.with_index do |s, i|
  S_HASH[i] = s
end

C_S_HASH = {}

C_ARY.each_with_index do |c, i|
  C_S_HASH[c] ||= []
  C_S_HASH[c] << S_HASH[i]
end

ANS_HASH = {}

C_S_HASH.each do |k, v|
  ANS_HASH[k] = (v[-1] + v[0..-2].join).chars
end

ans = []

C_ARY.each do |c|
  ans << ANS_HASH[c].shift
end

puts ans.join
