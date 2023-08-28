=begin
英大文字および英小文字からなる長さN の文字列S が与えられます。

これから、文字列S に対してQ 回の操作を行います。
i 番目(1≤i≤Q) の操作は整数
2 つと文字1 つからなる組
(ti,xi,ci) で表され、それぞれ次のような操作を表します。

ti=1 のとき、S のxi文字目をciに変更する。
ti=2 のとき、S に含まれる大文字すべてをそれぞれ小文字に変更する（xi,ciは操作に使用しない）。
ti=3 のとき、S に含まれる小文字すべてをそれぞれ大文字に変更する（xi,ciは操作に使用しない）。

Q 回の操作がすべて終わったあとのS を出力してください。

制約
1≤N≤5×10 ** 5
S は英大文字および英小文字からなる長さN の文字列
1≤Q≤5×10 ** 5
1≤ti≤3 (1≤i≤Q)
ti=1 ならば
1≤xi≤N (1≤i≤Q)
ciは英大文字もしくは英小文字
ti≠1 ならばxi=0 かつci= 'a'
N,Q,ti,xiはすべて整数

# 入力例
7
AtCoder
5
1 4 i
3 0 a
1 5 b
2 0 a
1 4 Y

# 出力例
atcYber

# 入力例
35
TheQuickBrownFoxJumpsOverTheLazyDog
10
2 0 a
1 19 G
1 13 m
1 2 E
1 21 F
2 0 a
1 27 b
3 0 a
3 0 a
1 15 i

# 出力例
TEEQUICKBROWMFiXJUGPFOVERTBELAZYDOG

=end

require 'prime'

N = gets.chomp.to_i
S = gets.chomp
Q = gets.chomp.to_i

S_INDEX_HASH = {}

S.chars.each_with_index do |s, i|
  S_INDEX_HASH[i] = s
end

Q_INDEX_HASH = {}

last_transrate_format_index = 0
how_transrate = 0

Q.times do |i|
  t, x, c = gets.chomp.split
  Q_INDEX_HASH[i] = {
    't' => t.to_i,
    'x' => x.to_i,
    'c' => c
  }
  if t.to_i != 1
    last_transrate_format_index = i
    how_transrate = t.to_i
  end
end

Q_INDEX_HASH.each do |k, v|
  case v['t']
  when 1
    S_INDEX_HASH[v['x'] - 1] = v['c']
  when 2
    if k == last_transrate_format_index
      S_INDEX_HASH.each do |k, v|
        S_INDEX_HASH[k] = v.downcase
      end
    end
  when 3
    if k == last_transrate_format_index
      S_INDEX_HASH.each do |k, v|
        S_INDEX_HASH[k] = v.upcase
      end
    end
  end
end

puts S_INDEX_HASH.values.join
