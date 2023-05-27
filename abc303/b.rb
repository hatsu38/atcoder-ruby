# frozen_string_literal: true

### 例
# 1,2,…,N と番号づけられた
# N 人が
# M 回、一列に並んで集合写真を撮りました。
# i 番目の撮影で左から
# j 番目に並んだ人の番号は
# a
# i,j
# ​
#   です。

# ある二人組は
# M 回の撮影で一度も連続して並ばなかった場合、不仲である可能性があります。　　

# 不仲である可能性がある二人組の個数を求めてください。なお、人
# x と人
# y からなる二人組と人
# y と人
# x からなる二人組は区別しません。
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
# 4 2
# 1 2 3 4
# 4 3 1 2

# output
# 2
# 上記の判定をするプログラムを作成してください。

N, M = gets.split.map(&:to_i)
grid = Array.new(M) { gets.chomp.split.map(&:to_i) }

hash = Hash.new(0)

[*1..N].combination(2).to_a.each do |a, b|
  hash[[a, b].sort] = false
end

grid.each_with_index do |g, _i|
  g.each_cons(2) do |a, b|
    hash[[a, b].sort] = true
  end
end

puts(hash.values.count(&:!))
