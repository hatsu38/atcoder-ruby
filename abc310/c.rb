=begin
ボールがいくつか刺さった棒が N 本あり、各ボールには英小文字が 1 個書かれています。
i=1,2,…,N について、i 番目の棒に刺さった各ボールの英小文字は、文字列 S iによって表されます。
具体的には、i 番目の棒には文字列 S iの長さ ∣S i ∣ に等しい個数のボールが刺さっており、
刺さっているボールの英小文字を、棒のある端から順に並べたものは文字列 S iと等しいです。

2 つの棒は、一方の棒に刺さっているボールの英小文字をどちらかの端から並べた列と、
もう一方の棒に刺さっているボールの英小文字をどちらかの端から並べた列が一致するとき、同じ棒とみなされます。
より形式的には、
1 以上 N 以下の整数 i,j について、
i 本目の棒と j 本目の棒は、S iが S jと一致するか、
S iが S jを前後反転したものと一致するとき、かつそのときに限り、同じとみなされます。

N 本の棒の中に、何種類の異なる棒があるかを出力してください。

制約
N は整数
2≤N≤2×10 ** 5
S iは英小文字のみからなる文字列
∣S i∣≥1
∑ i=1N∣S i∣≤2×10 5入力はすべて整数

# input
6
a
abc
de
cba
de
abc

# output
3

=end

require 'prime'

N = gets.chomp.to_i

s_hash = {}

N.times do |_i|
  s = gets.chomp
  s_reverse = s.reverse
  if s_hash[s]
    s_hash[s] += 1
  elsif s_hash[s_reverse]
    s_hash[s_reverse] += 1
  else
    s_hash[s] = 0
  end
end

puts s_hash.keys.count
