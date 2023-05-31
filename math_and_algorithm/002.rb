# frozen_string_literal: true

# 3 つの整数
# A 1,A 2,A 3が与えられます。A1+A2+A3を出力してください。
#
# input
# 10 20 50
# output
# 80

i, j, k = gets.chomp.split.map(&:to_i)

puts i + j + k
