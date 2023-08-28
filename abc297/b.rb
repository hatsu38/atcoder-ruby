# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# RNBQKBNR
# 出力例
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
# 入力例
# RNBQKBNR
# 出力例
# Yes
# 上記の判定をするプログラムを作成してください。

s = gets.chomp.chars

first_idx = s.find_index('B') + 1
last_idx = s.rindex('B') + 1

if (first_idx.odd? && last_idx.odd?) || (first_idx.even? && last_idx.even?)
  puts 'No'
  exit
end

k_idx = s.find_index('K')
r_idx = s.find_index('R')
last_r_idx = s.rindex('R')

if k_idx < r_idx || k_idx > last_r_idx
  puts 'No'
  exit
end

puts 'Yes'
