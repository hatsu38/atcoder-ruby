=begin
高橋くんは文字列
s を持っており、文字列
t を作りたいと思っています。 高橋くんは、文字列の末尾の
1 文字を先頭に追加し、末尾の
1 文字を削除するという操作を文字列
s に行うことで、文字列
s を文字列
t にしたいと考えています。

最小で何回この操作を行えば、文字列
s を文字列
t にできるでしょうか？最小の操作回数を出力するプログラムを書いてください。この操作では文字列
s を文字列
t に変換することができない場合、
−1 と出力してください。

制約
2≤N≤10
1≤M≤ N(N−1) / 2
1≤Ai<Bi≤N
(Ai,Bi) は相異なる
1≤Ci≤10**8

入力は全て整数である

# 入力例
abcd
dabc

# 出力例
1

# 入力例
abcabcabc
bcabcabca

# 出力例
2

# 入力例
aaa
a

# 出力例
-1

# 入力例
cab
cab

# 出力例
0

=end

require 'prime'

s = gets.chomp.chars
t = gets.chomp.chars

count = 0

s.size.times do |_i|
  if s == t
    puts count
    exit
  end
  s.unshift(s.pop)
  count += 1
end

puts(-1)
