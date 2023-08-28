# frozen_string_literal: true

# 3 つの整数
# A
# 1
# ​
#  ,A
# 2
# ​
#  ,A
# 3
# ​
#   が与えられます。
#
# A
# 1
# ​
#  A
# 2
# ​
#  A
# 3
# ​
#   を出力するプログラムを作成してください。
#
# 入力例
# 2 8 8
#
# 出力例
# 128
#

n_ary = gets.chomp.split.map(&:to_i)

puts n_ary.inject(:*)
