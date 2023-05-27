# frozen_string_literal: true

### 例
# 二つの文字
# x と
# y は以下の
# 3 つの条件のうちどれか
# 1 つを満たすとき、似た文字と呼ばれます。

# x と
# y は同じ文字
# x と
# y の片方が 1 で、もう片方が l
# x と
# y の片方が 0 で、もう片方が o
# また、長さ
# N の文字列
# S と
# T は以下の条件を満たすとき、似た文字列と呼ばれます。

# 任意の
# i (1≤i≤N) について、
# S の
# i 番目の文字と
# T の
# i 番目の文字は似た文字
# 英小文字及び数字からなる長さ
# N の文字列
# S,T が与えられます。
# S と
# T が似た文字列か判定してください

# input
# 3
# l0w
# 1ow
# output
# Yes

gets.chomp.to_i
s = gets.chomp
t = gets.chomp

s_fmt = s.tr('0', 'o').tr('1', 'l')
t_fmt = t.tr('0', 'o').tr('1', 'l')

puts s_fmt == t_fmt ? 'Yes' : 'No'
