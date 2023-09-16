=begin
## 問題文
座標平面上に1からNの番号がついたN人の人がいます。
人1は原点にいます。
次の形式の情報がM個与えられます。
人Ai​から見て、人Bi​は、x軸正方向にXi​、y軸正方向にYi​離れた位置にいるそれぞれの人がいる座標を求めてください。
一意に定まらないときはそのことを報告してください。

## 制約
1≤N≤2×10**5
0≤M≤2×10**5
1≤Ai​,Bi​≤N
Ai​≠Bi​
−10**9≤Xi​,Yi​≤10**9
入力は全て整数である
与えられる情報は矛盾しない

## 入力入力は以下の形式で標準入力から与えられる。
N M
A1​ B1​ X1​ Y1​
⋮
AM​ BM​ XM​ YM​

## 出力N 行出力せよ。
人 i のいる座標が一意に定まらないとき、i 行目には undecidable と出力せよ。
人 i のいる座標が (si​,ti​) と一意に定まるとき、i 行目には si​,ti​ をこの順に空白区切りで出力せよ。

## 入力例 1
3 2
1 2 2 1
1 3 -1 -2

## 出力例 1
0 0
2 1
-1 -2

3 人の位置関係は下図のようになっています。

## 入力例 2
3 2
2 1 -2 -1
2 3 -3 -3

## 出力例 2
0 0
2 1
-1 -2

3 人の位置関係は下図のようになっています。

## 入力例 3
5 7
1 2 0 0
1 2 0 0
2 3 0 0
3 1 0 0
2 1 0 0
3 2 0 0
4 5 0 0

## 出力例 3
0 0
0 0
0 0
undecidable
undecidable

同じ情報が複数回与えられたり、同じ座標に複数の人がいることもあります。

=end

require 'prime'

n, m = gets.split.map(&:to_i)
rels = Array.new(m) { gets.split.map(&:to_i) }

# 座標を初期化
codes = Array.new(n, [nil, nil])
codes[0] = [0, 0]

# BFS用キュー
queue = [1]

# 各人に関連する情報を高速に取得できるようなデータ構造を用意
relation_map = Hash.new { |hash, key| hash[key] = [] }

rels.each do |relation|
  a, b, x, y = relation
  relation_map[a] << [b, x, y]
  relation_map[b] << [a, -x, -y]
end

# 座標が決まった人をキューに入れて、その人の位置に基づいて他の人の位置を計算
until queue.empty?
  current = queue.shift
  related_rels = relation_map[current]

  related_rels.each do |relation|
    b, x, y = relation

    if codes[b - 1] == [nil, nil]
      codes[b - 1] = [codes[current - 1][0] + x, codes[current - 1][1] + y]
      queue.push(b)
    end
  end
end

codes.each do |coordinate|
  if coordinate == [nil, nil]
    puts 'undecidable'
  else
    puts "#{coordinate[0]} #{coordinate[1]}"
  end
end
