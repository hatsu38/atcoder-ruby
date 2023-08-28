# frozen_string_literal: true

# 整数
# N と
# N 個の整数
# A
# 1
# ​
#  ,A
# 2
# ​
#  ,⋯,A
# N
# ​
#   が与えられます。（入力の形式は「入力」セクションを参照）
#
# A
# 1
# ​
#  +A
# 2
# ​
#  +⋯+A
# N
# ​
#   を出力してください。
#
# 入力例
# 5
# 3 1 4 1 5
#
# 出力例
# 14

gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

puts a.sum
