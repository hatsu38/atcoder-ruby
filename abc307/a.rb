=begin
高橋君は
N 週間の間、自分が歩いた歩数を記録しました。
i 日目に歩いた歩数は
A iでした。

各週に高橋君が歩いた歩数の合計を求めてください。
より正確には、
1 週目( 1 日目から 7 日目まで)の 7 日間の歩数の合計、
2 週目( 8 日目から 14 日目まで)の
7 日間の歩数の合計、……をそれぞれ求めてください。

# input
3
14159 26535 89793 23846 26433 83279 50288 41971 69399 37510 58209 74944 59230 78164 6286 20899 86280 34825 34211 70679 82148

# output
314333 419427 335328

=end

require 'prime'

gets.chomp.to_i
ary = gets.chomp.split.map(&:to_i)
sum_ary = ary.each_slice(7).map(&:sum)

puts sum_ary.join(' ')
