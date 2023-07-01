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

res = %w[s n u k]

H, W = gets.chomp.split.map(&:to_i)

S = []
H.times do |i|
  S[i] = gets.chomp.chars
end

dx = [-1, 0, 1, 0]
dy = [0, -1, 0, 1]
paths = [] # 全ての経路を保存する配列
queue = [[[0, 0]]] # 初期経路のスタック。座標の配列を要素とする。

if S[0][0] != 's'
  puts 'No'
  exit
end

def in_grid?(x, y, h, w)
  0 <= x && x < h && 0 <= y && y < w
end

while queue.size > 0
  path = queue.pop # 現在の経路を取り出す
  x, y = path.last # 現在の経路の最後の座標
  if [x, y] == [H - 1, W - 1]
    paths << path
    next
  end
  4.times do |i|
    nx, ny = x + dx[i], y + dy[i]
    if in_grid?(nx, ny, H, W) && !path.include?([nx, ny])
      new_path = path.dup
      new_path << [nx, ny]
      queue << new_path
    end
  end
end

paths.each do |path|
  # puts "=" * 10
  correct_count = 0
  find_index = 0
  path.each do |x, y|
    # puts "res[find_index] #{res[find_index]}"
    # puts "S[x][y] #{S[x][y]}"
    if S[x][y] == res[find_index]
      find_index >= 3 ? find_index = 0 : find_index += 1
      correct_count += 1
    end
  end
  if correct_count == path.size
    puts 'Yes'
    exit
  end
end

puts 'No'
