=begin
高橋君は、レストランで「AtCoder ドリンク」というドリンクを飲もうとしています。 AtCoder ドリンクは定価である
P 円を払えば飲むことができます。

また、高橋君は割引券を持っており、それを使うと AtCoder ドリンクを定価より安い価格である
Q 円で飲むことができますが、 その場合には AtCoder ドリンクの他に、
N 品ある料理の中から
1 つを追加で注文しなければなりません。
i=1,2,…,N について、
i 番目の料理の価格は D i円です。

高橋君がドリンクを飲むため支払う合計金額の最小値を出力してください。

# 入力例
3 100 50
60 20 40

# 出力例
Yes

=end

require 'prime'

N, P, Q = gets.chomp.split.map(&:to_i)
D_ARY = gets.chomp.split.map(&:to_i)

puts [Q + D_ARY.min, P].min
