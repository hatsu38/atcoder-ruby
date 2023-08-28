=begin
祭壇に、左から右へと一列に並ぶ
N 個の石が祀られています。
左からi 個目(1≤i≤N) の石の色は文字ciとして与えられ、ciが R のとき赤、W のとき白です。

あなたは、以下の二種の操作を任意の順に何度でも行うことができます。

石を2 個選び (隣り合っていなくてもよい)、それらを入れ替える。
石を1 個選び、その石の色を変える (赤なら白に、白なら赤に)。
占い師によると、赤い石の左隣に置かれた白い石は災いを招きます。
そのような白い石がない状態に至るには、最小で何回の操作が必要でしょうか。

制約
2≤N≤200000
c iは R または W

# 入力例
4
WWRR

# 出力例
2

# 入力例
2
RR

# 出力例
0

# 入力例
8
WRWWRWRR

# 出力例
3

=end

require 'prime'

n = gets.chomp.to_i

c_index_hash = {}

gets.chomp.chars.each_with_index do |c, i|
  c_index_hash[i] = c
end

red = 0
white = 0
white_count_index_hash = {}

n.times do |i|
  c_index_hash[i] == 'R' ? red += 1 : white += 1
  white_count_index_hash[i] = white
end

if red.zero?
  puts 0
else
  puts white_count_index_hash[red - 1]
end
