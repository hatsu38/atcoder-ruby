=begin
人1 、人2 、… 、人N の
N 人の人がルーレットの賭けに参加しました。 このルーレットの出目は、
0 から36 までの37 個の整数のうちいずれかです。
i=1,2,…,N について、人i は
37 個の目のうち
Ci個の目
Ai,1,Ai,2,…,Ai,Ci
​に賭けました。

ルーレットが回され、出目はX でした。
X に賭けた人たちのうち、賭けた目の個数が最も少ない人たちの番号を昇順にすべて出力してください。

より形式的には、
1 以上N 以下の整数i であって、下記の
2 つの条件をともに満たすものを昇順にすべて出力してください。

人i はX に賭けている。
任意のj=1,2,…,N について「人j がX に賭けているならば、Ci≤Cj」が成り立つ。
出力するべき番号が1 つも無い場合もあることに注意してください（入力例２を参照）。

制約
1≤N≤100
1≤Ci≤37
0≤Ai,j≤36
任意のi=1,2,…,N について、Ai,1,Ai,2,…,Ai,Ciはすべて異なる。
0≤X≤36
入力はすべて整数

# 入力例
4
3
7 19 20
4
4 19 24 0
2
26 10
3
19 31 24
19

# 出力例
2
1 4

# 入力例
3
1
1
1
2
1
3
0

# 出力例
0

=end

require 'prime'
N = gets.chomp.to_i

C_A_HASH = {}

N.times do |i|
  gets.chomp.to_i
  C_A_HASH[i + 1] = gets.chomp.split.map(&:to_i)
end

X = gets.chomp.to_i

ANS_HASH = {}

C_A_HASH.each do |k, v|
  ANS_HASH[k] = v.size if v.include?(X)
end

if ANS_HASH.empty?
  puts 0
  puts ''
  exit
end

min = ANS_HASH.values.min

min_anses = []

ANS_HASH.each do |k, v|
  min_anses << k if v == min
end

puts min_anses.size
puts min_anses.join(' ')
