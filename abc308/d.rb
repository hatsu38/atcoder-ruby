=begin
H 行
W 列のグリッドがあります。
以下、上から i 行目、左から j 列目のマスを (i,j) と表記します。
グリッドの各マスには英小文字が書かれており、
(i,j) に書かれた文字は与えられる文字列
Siの j文字目と一致します。

すぬけくんは、辺で隣接するマスに移動することを繰り返して
(1,1) から (H,W) まで移動しようと思っています。
訪れるマス （最初の (1,1) と 最後の (H,W) を含む）に書かれた文字が、
訪れる順に s → n → u → k → e → s → n →… となるような経路が存在するか判定してください。
なお、
2 つのマス
(i 1,j 1), (i 2,j 2) は
∣i1−i2∣+∣j1−j2∣=1 を満たすとき、またそのときに限り「辺で隣接する」といいます。

より厳密には、マスの列
((i 1,j 1),(i 2,j 2),…,(i k,j k)) であって以下の条件を全て満たすものが存在するか判定してください。

(i 1,j 1)=(1,1),(i k,j k)=(H,W)
すべての t (1≤t<k) について、
(it,j t) と
(it+1,jt+1) は辺で隣接する
すべての t (1≤t≤k) について、
(it,jt) に書かれた文字は snuke の ((t−1)mod5)+1 文字目と一致する

制約
2≤H,W≤500
H,W は整数S iは英小文字からなる長さ W の文字列

# input
2 3
sns
euk

# output
Yes

# input
2 2
ab
cd

# output
No

# input
5 7
skunsek
nukesnu
ukeseku
nsnnesn
uekukku

# output
Yes
=end

require 'prime'

H, W = gets.chomp.split.map(&:to_i)

S = []
H.times do |i|
  S[i] = gets.chomp.chars.map { |c| [c, false] }
end

NEXT_CHAR = {
  's' => 'n',
  'n' => 'u',
  'u' => 'k',
  'k' => 'e',
  'e' => 's'
}

unless S[0][0][0] == 's'
  puts 'No'
  exit
end

queue = [[0, 0, S[0][0][0]]]

until queue.empty?
  h, w, c = queue.pop
  if h == H - 1 && w == W - 1
    puts 'Yes'
    exit
  end
  prev_row = h.positive? ? S[h - 1] : nil
  current_row = S[h]
  next_row = h < H - 1 ? S[h + 1] : nil
  current_row[w][1] = true
  next_c = NEXT_CHAR[c]

  queue << [h - 1, w, next_c] if h.positive? && !prev_row[w][1] && prev_row[w][0] == next_c

  queue << [h + 1, w, next_c] if h < H - 1 && !next_row[w][1] && next_row[w][0] == next_c

  queue << [h, w - 1, next_c] if w.positive? && !current_row[w - 1][1] && current_row[w - 1][0] == next_c

  queue << [h, w + 1, next_c] if w < W - 1 && !current_row[w + 1][1] && current_row[w + 1][0] == next_c
end

puts 'No'
