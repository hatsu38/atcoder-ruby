=begin
1 から 9 までの数字が書かれた 3×3 の盤面があります。

1 以上 9 以下の整数
A,B が与えられます。ただし、A<B です。

A が書かれたマスと B が書かれたマスが左右に隣接しているか判定してください。

# input
7 8

# output
Yes

=end

require 'prime'

A, B = gets.chomp.split.map(&:to_i)

hash = {
  1 => [2],
  2 => [1, 3],
  3 => [2],
  4 => [5],
  5 => [4, 6],
  6 => [5],
  7 => [8],
  8 => [7, 9],
  9 => [8]
}

puts hash[A].include?(B) ? 'Yes' : 'No'
