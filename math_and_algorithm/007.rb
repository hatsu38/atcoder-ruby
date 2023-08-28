# frozen_string_literal: true

=begin
N 以下の正の整数の中で、
X の倍数または
Y の倍数であるものの個数はいくつありますか？

入力例
15 3 5
出力例
7
=end

n, x, y = gets.chomp.split.map(&:to_i)

puts((1..n).count { |i| (i % x).zero? || (i % y).zero? })
