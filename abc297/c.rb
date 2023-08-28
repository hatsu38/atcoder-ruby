# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# H 個の長さ
# W の ., T からなる文字列
# S
# 1
# ​
#  ,S
# 2
# ​
#  ,…,S
# H
# ​
#   が与えられます。

# 高橋君は以下の操作を
# 0 回以上何回でも行うことができます。

# 1≤i≤H,1≤j≤W−1 を満たす整数であって、
# S
# i
# ​
#   の
# j 番目の文字も
# j+1 番目の文字も T であるようなものを選ぶ。
# S
# i
# ​
#   の
# j 番目の文字を P で置き換え、
# S
# i
# ​
#   の
# j+1 番目の文字を C で置き換える。
# 高橋君が操作回数の最大化を目指すとき、操作終了後の
# S
# 1
# ​
#  ,S
# 2
# ​
#  ,…,S
# H
# ​
#   としてあり得るものの一例を出力してください。
# 入力例
# 2 3
# TTT
# T.T
# 出力例
# PCT
# T.T

h, = gets.chomp.split.map(&:to_i)
strs = Array.new(h) { gets.chomp }

strs.each_with_index do |str, _idx|
  puts str.gsub!('TT', 'PC')
end
