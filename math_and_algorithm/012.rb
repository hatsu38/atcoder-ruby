=begin
N が素数であるかどうかを判定してください。

input
53
output
Yes
=end
require 'prime'

n = gets.chomp.to_i

puts n.prime? ? 'Yes' : 'No'
