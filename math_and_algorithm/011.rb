=begin
N 以下の素数を、小さい順に出力してください。

2≤N≤3000

入力例
10
出力例
2 3 5 7
=end
require 'prime'

n = gets.chomp.to_i

puts (2..n).select(&:prime?).join(' ')
