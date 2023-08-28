=begin
N が素数であるかどうかを判定してください。

入力例
53
出力例
Yes
=end
require 'prime'

n = gets.chomp.to_i

puts n.prime? ? 'Yes' : 'No'
