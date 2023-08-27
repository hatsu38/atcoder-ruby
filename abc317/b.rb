=begin
ナオヒロ君は
N+1 個の連続する整数を
1 個ずつ持っていましたが、そのうち
1 個をなくしてしまいました。

残っている
N 個の整数が順不同で
A
1
​
 ,…,A
N
​
  として与えられるので、なくした整数を求めてください。

なお、なくした整数が一意に定まるような入力のみが与えられます。

制約
2≤N≤100
1≤A
i
​
 ≤1000
入力は全て整数である
なくした整数は一意に定まる
# input
3
2 3 5

# output
4

# input
8
3 1 4 5 9 2 6 8

# output
7

# input
16
152 153 154 147 148 149 158 159 160 155 156 157 144 145 146 150

# output
151

=end

require 'prime'

N = gets.chomp.to_i
A_ARY = gets.chomp.split.map(&:to_i)

min = A_ARY.min
max = A_ARY.max

puts (min..max).to_a.sum - A_ARY.sum
