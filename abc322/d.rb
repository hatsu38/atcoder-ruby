=begin
## 問題文
いくつかの正方形を辺でつなげてできる、連結な多角形の形をしたパズルのピースのことをポリオミノと呼びます。
縦4マス、横4マスのグリッドと、グリッドに収まる大きさの3個のポリオミノがあります。
i番目のポリオミノの形は16個の文字Pi,j,k​(1≤j,k≤4)によって表されます。
Pi,j,k​は何も置かれていないグリッドにi番目のポリオミノを置いたときの状態を意味して、Pi,j,k​が#の場合は上からj行目、左からk列目のマスにポリオミノが置かれていることを、.の場合は置かれていないことを意味します。
(入出力例1の図も参考にしてください。)あなたは次の条件を全て満たすように3個のポリオミノ全てをグリッドに敷き詰めることにしました。
グリッドの全てのマスはポリオミノで覆われている。
ポリオミノ同士が重なるように置くことはできない。
ポリオミノがグリッドからはみ出るように置くことはできない。
ポリオミノの平行移動と回転は自由に行うことができるが、裏返すことはできない。
条件を満たすようにグリッドにポリオミノを敷き詰めることは可能ですか？

## 制約
Pi,j,k​ は # または .
与えられるポリオミノは連結である。つまり、ポリオミノを構成する正方形同士は、正方形のみを上下左右に辿って互いに行き来できる
与えられるポリオミノは空でない

## 入力入力は以下の形式で標準入力から与えられる。
P1,1,1​ P1,1,2 ​P1,1,3 ​P1,1,4​
P1,2,1 P1,2,2 ​P1,2,3 ​P1,2,4​
P1,3,1 ​P1,3,2 ​P1,3,3 ​P1,3,4​
P1,4,1​ P1,4,2 ​P1,4,3 ​P1,4,4​
P2,1,1​ P2,1,2 ​P2,1,3​ P2,1,4​
P2,2,1​ P2,2,2 ​P2,2,3​ P2,2,4​
P2,3,1​ P2,3,2 ​P2,3,3​ P2,3,4​
P2,4,1​ P2,4,2 ​P2,4,3​ P2,4,4​
P3,1,1​ P3,1,2 ​P3,1,3​ P3,1,4​
P3,2,1​ P3,2,2 ​P3,2,3​ P3,2,4​
P3,3,1​ P3,3,2 ​P3,3,3​ P3,3,4​
P3,4,1​ P3,4,2 ​P3,4,3​ P3,4,4​

## 出力問題文の条件を満たすようにポリオミノを敷き詰めることが可能である場合は Yes を、そうでない場合は No を出力せよ。

## 入力例 1
....
###.
.#..
....
....
.###
.##.
....
..#.
.##.
.##.
.##.

## 出力例 1
Yes

入力例 1
 に対応するポリオミノの形は次の図のようになります。
この場合、次の図のようにポリオミノを配置することで、問題文の条件を満たすようにグリッドにポリオミノを敷き詰めることができます。
よって答えは Yes になります。

## 入力例 2
###.
#.#.
##..
....
....
..#.
....
....
####
##..
#...
#...

## 出力例 2
Yes

入力例 2
 の 1 番目のポリオミノのように、ポリオミノは穴の空いた多角形の形をしている場合があります。

## 入力例 3
##..
#..#
####
....
....
##..
.##.
....
.#..
.#..
.#..
.#..

## 出力例 3
No

ポリオミノを敷き詰めるときに、ポリオミノを裏返してはならないのに注意してください。

## 入力例 4
....
..#.
....
....
....
..#.
....
....
....
..#.
....
....

## 出力例 4
No

## 入力例 5
....
####
#...
#...
....
####
...#
..##
....
..##
..#.
..##

## 出力例 5
No

## 入力例 6
###.
.##.
..#.
.###
....
...#
..##
...#
....
#...
#...
#...

## 出力例 6
Yes

=end

require 'prime'

g1 = Array.new(4) { gets.chomp.chars.map { |e| e == '#' ? 1 : 0 } }
g2 = Array.new(4) { gets.chomp.chars.map { |e| e == '#' ? 1 : 0 } }
g3 = Array.new(4) { gets.chomp.chars.map { |e| e == '#' ? 1 : 0 } }

if g1.flatten.sum + g2.flatten.sum + g3.flatten.sum != 16
  puts 'No'
  exit
end

def trim(grid)
  grid.shift while grid[0].all?(0)
  grid.pop while grid[-1].all?(0)
  grid = grid.transpose
  grid.shift while grid[0].all?(0)
  grid.pop while grid[-1].all?(0)
  grid.transpose
end

po1 = trim(g1)
po2 = trim(g2)
po3 = trim(g3)

def make_pats(po_x)
  pats = []
  4.times do
    po_x = po_x.transpose.reverse
    h = po_x.size
    w = po_x[0].size
    (4 - h + 1).times do |i|
      (4 - w + 1).times do |j|
        grid = Array.new(4) { Array.new(4, 0) }
        h.times do |ii|
          w.times do |jj|
            grid[i + ii][j + jj] = po_x[ii][jj]
          end
        end
        pats << grid
      end
    end
  end
  pats
end

pats1 = make_pats(po1)
pats2 = make_pats(po2)
pats3 = make_pats(po3)

def examine(pat1, pat2, pat3)
  grid = Array.new(4) { Array.new(4, 0) }
  [pat1, pat2, pat3].each do |pat|
    pat.each_with_index do |row, i|
      row.each_with_index do |c, j|
        grid[i][j] += c
      end
    end
  end
  grid.all? { |r| r.all?(1) }
end

pats1.each do |pat1|
  pats2.each do |pat2|
    pats3.each do |pat3|
      if examine(pat1, pat2, pat3)
        puts 'Yes'
        exit
      end
    end
  end
end
puts 'No'
