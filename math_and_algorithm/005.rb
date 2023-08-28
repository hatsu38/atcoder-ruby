# frozen_string_literal: true

# N 個の整数
# a
# 1
# ​
#  ,a
# 2
# ​
#  ,⋯,a
# N
# ​
#   が与えられます。
#
# (a
# 1
# ​
#  +a
# 2
# ​
#  +⋯+a
# N
# ​
#  )mod100 の値を出力してください。
#
# 入力例
# 3
# 30 50 70
#
# 出力例
# 50
#

gets.chomp.to_i
a_ary = gets.chomp.split.map(&:to_i)

puts a_ary.sum % 100
