# frozen_string_literal: true

### 例
# 縦
# H マス
# × 横
# W マスのマス目があり、各マスに
# 1 つずつ英小文字が書き込まれています。 上から
# i 行目かつ左から
# j 列目のマスを
# (i,j) で表します。

# マス目に書き込まれている英小文字は
# H 個の長さ
# W の文字列
# S
# 1
# ​
#  ,S
# 2
# ​
#  ,…,S
# H
# ​
#   によって与えられ、
# S
# i
# ​
#   の
# j 文字目が、
# (i,j) に書き込まれた英小文字を表します。

# マス目の中に、s, n, u, k, e が この順に(縦・横・ななめのいずれかの方向に) 連続して並んでいる 場所がただ
# 1 つ存在します。
# そのような場所を見つけ、そのマスの位置を出力の形式に従って出力してください。
# input
# RNBQKBNR
# output
# Yes

# 長さ
# 8 の文字列
# S が与えられます。
# S には K, Q がちょうど
# 1 文字ずつ、R, B, N がちょうど
# 2 文字ずつ含まれます。
# S が以下の条件を全て満たしているか判定してください。

# S において左から
# x,y (x<y) 文字目が B であるとする。このとき
# x と
# y の偶奇が異なる。

# K は
# 2 つの R の間にある。より形式的には、
# S において左から
# x,y (x<y) 文字目が R であり、
# z 文字目が K であるとする。このとき、
# x<z<y が成り立つ。

# 例
# input
# RNBQKBNR
# output
# Yes
# 上記の判定をするプログラムを作成してください。

H, W = gets.split.map(&:to_i)
grid = Array.new(H) { gets.chomp.chars }

# マスを探索するための方向ベクトルを定義します。
# 上、下、左、右、左上、右上、左下、右下の8方向です。
dx = [-1, 1, 0, 0, -1, -1, 1, 1]
dy = [0, 0, -1, 1, -1, 1, -1, 1]

# ターゲット文字列を定義します。
target = 'snuke'.chars

# 各セルについて
H.times do |i|
  W.times do |j|
    # 各方向について
    8.times do |dir|
      # ターゲット文字列の長さ分だけその方向に進みます。
      match = true
      5.times do |k|
        ni = i + (dx[dir] * k)
        nj = j + (dy[dir] * k)
        # グリッドの外に出た場合や、文字が一致しない場合はフラグを更新します。
        if ni.negative? || ni >= H || nj.negative? || nj >= W || grid[ni][nj] != target[k]
          match = false
          break
        end
      end
      # ターゲット文字列が見つかった場合はその位置を出力します。
      next unless match

      5.times do |k|
        ni = i + (dx[dir] * k)
        nj = j + (dy[dir] * k)
        # 座標は1-indexedで出力します。
        puts "#{ni + 1} #{nj + 1}"
      end
    end
  end
end
