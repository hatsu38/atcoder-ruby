=begin
N×M のグリッドがあり、この上にプレイヤーがいます。
このグリッドの上から i 行目、左から j 列目をマス (i,j) と書きます。
このグリッドの各マスは 氷 か 岩 であり、
その情報は N 個の長さ M の文字列 S 1,S 2,…,S Nとして与えられます。

もし S iの j 文字目が . なら、マス (i,j) は 氷 である。
もし S iの j 文字目が # なら、マス (i,j) は 岩 である。
なお、このグリッドの外周 ( 1 行目、 N 行目、 1 列目、 M 列目の全てのマス ) は 岩 です。

最初、プレイヤーはマス (2,2) の上で停止しています。このマスは 氷 です。
プレイヤーは以下の行動を 0 度以上何度でも行うことができます。

まず、プレイヤーは上下左右の移動方向を指定する。
その後、プレイヤーは岩のマスにぶつかるまでその方向に移動する。厳密には以下の通りである。
もし移動方向に隣接するマスが 氷 なら、そのマスに移動し、同じ方向に移動を継続する。
もし移動方向に隣接するマスが 岩 なら、今いるマスに留まり、移動を終了する。
プレイヤーが触れる (通過または上で停止する) ことができる 氷 の数を求めてください。

制約
3≤N,M≤200
S iは # と . からなる長さ M の文字列
i=1 または i=N または j=1 または j=M であるとき、マス (i,j) は 岩
マス (2,2) は 氷

# 入力例
6 6
######
#....#
#.#..#
#..#.#
#....#
######

# 出力例
12

# 入力例
21 25
#########################
#..............###...####
#..............#..#...###
#........###...#...#...##
#........#..#..#........#
#...##...#..#..#...#....#
#..#..#..###...#..#.....#
#..#..#..#..#..###......#
#..####..#..#...........#
#..#..#..###............#
#..#..#.................#
#........##.............#
#.......#..#............#
#..........#....#.......#
#........###...##....#..#
#..........#..#.#...##..#
#.......#..#....#..#.#..#
##.......##.....#....#..#
###.............#....#..#
####.................#..#
#########################

# 出力例
215

=end

require 'prime'

N, M = gets.split.map(&:to_i)
S = (0...N).map do
  gets.chomp.chars.map do |c|
    c == '#' ? 1 : 0
  end
end

bfs = []
bfs << [1, 1]
step_counter = (0...N).map do
  Array.new(M, 0)
end
step_counter[1][1] = 1
visited_corners = (0...N).map do
  Array.new(M, 0)
end
visited_corners[1][1] = 1

until bfs.empty?
  now_i, now_j = bfs.shift

  # up
  offset = 0
  while S[now_i + offset - 1][now_j].zero?
    offset -= 1
    step_counter[now_i + offset][now_j] = 1
  end
  if visited_corners[now_i + offset][now_j].zero?
    bfs << [now_i + offset, now_j]
    visited_corners[now_i + offset][now_j] = 1
  end

  # down
  offset = 0
  while S[now_i + offset + 1][now_j].zero?
    offset += 1
    step_counter[now_i + offset][now_j] = 1
  end
  if visited_corners[now_i + offset][now_j].zero?
    bfs << [now_i + offset, now_j]
    visited_corners[now_i + offset][now_j] = 1
  end

  # rignt
  offset = 0
  while S[now_i][now_j + offset + 1].zero?
    offset += 1
    step_counter[now_i][now_j + offset] = 1
  end
  if visited_corners[now_i][now_j + offset].zero?
    bfs << [now_i, now_j + offset]
    visited_corners[now_i][now_j + offset] = 1
  end

  # left
  offset = 0
  while S[now_i][now_j + offset - 1].zero?
    offset -= 1
    step_counter[now_i][now_j + offset] = 1
  end
  next unless visited_corners[now_i][now_j + offset].zero?

  bfs << [now_i, now_j + offset]
  visited_corners[now_i][now_j + offset] = 1
end

puts step_counter.sum(&:sum)
