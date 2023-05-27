# frozen_string_literal: true

# # 英小文字からなる長さ
# 二次元平面の点
# (0,0) に高橋君がいます。初め、高橋君の体力は
# H です。また、二次元平面には
# M 個の体力を回復するアイテムがあり、
# i 個目のアイテムは点
# (x
# i
# ​
#  ,y
# i
# ​
#  ) に置いてあります。

# 高橋君は、これから
# N 回の移動をします。
# i 回目の移動は以下の方法で行われます。

# 今高橋君がいる点を
# (x,y) とする。体力を
# 1 消費し、
# S の
# i 番目の文字
# S
# i
# ​
#   に応じて以下の点に移動する。

# S
# i
# ​
#   が R のとき：
# (x+1,y)
# S
# i
# ​
#   が L のとき：
# (x−1,y)
# S
# i
# ​
#   が U のとき：
# (x,y+1)
# S
# i
# ​
#   が D のとき：
# (x,y−1)
# 高橋君の体力が負になった場合、高橋君は倒れてしまい、移動をやめる。そうでない場合、移動した点にアイテムがあり、かつ高橋君の体力が
# K 未満ならば、移動した点に置かれたアイテムを消費し、高橋君の体力が
# K になる。

# 高橋君が一度も倒れることなく
# N 回の移動を行えるか判定してください。

# S は R, L, U, D からなる長さ N の文字列

# input
# 4 4
# bbed
# abcd
# abed
# fbed

# output
# Yes

n, m, h, k = gets.chomp.split(' ').map(&:to_i)
S = gets.chomp
hash = Hash.new(0)
Array.new(m) do
  hash[gets.to_s.chomp.split(' ').map(&:to_i)] = true
end

x = 0
y = 0

n.times do |i|
  h -= 1
  if h.negative?
    puts 'No'
    exit
  end
  case S[i]
  when 'R'
    x += 1
  when 'L'
    x -= 1
  when 'U'
    y += 1
  when 'D'
    y -= 1
  end
  next if h >= k || hash[[x, y]] != true

  h = k
  hash[[x, y]] = false
end

puts 'Yes'
