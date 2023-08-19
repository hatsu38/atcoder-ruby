=begin

AtCoder 国の暦では、一年は
1,2,…,M 番目の月の
M か月からなり、そのうち
i 番目の月は
1,2,…,D
i
​
  番目の日の
D
i
​
  日からなります。
さらに、 AtCoder 国の一年の日数は奇数、即ち
D
1
​
 +D
2
​
 +⋯+D
M
​
  は奇数です。
一年の真ん中の日は何番目の月の何番目の日か求めてください。
言い換えると、
1 番目の月の
1 番目の日を
1 日目としたときの
(D
1
​
 +D
2
​
 +⋯+D
M
​
 +1)/2 日目が何番目の月の何番目の日かを求めてください。

制約
入力は全て整数
1≤M≤100
1≤D
i
​
 ≤100
D
1
​
 +D
2
​
 +⋯+D
M
​
  は奇数

# input
12
31 28 31 30 31 30 31 31 30 31 30 31

# output
7 2

# input
1
1

# output
1 1

# input
6
3 1 4 1 5 9

# output
5 3

=end

require 'prime'

M = gets.chomp.to_i
D = gets.chomp.split.map(&:to_i)

D_SUM = D.sum

center_day = (D_SUM + 1) / 2

D.each_with_index do |d, i|
  if center_day <= d
    puts "#{i + 1} #{center_day}"
    exit
  else
    center_day -= d
  end
end
