=begin
## 問題文
高橋君は料理1からNのN品の料理を作ろうとしています。
料理iはオーブンを連続したTi​分間使うことで作れます。
1つのオーブンを2つ以上の料理のために同時に使うことはできません。
2つのオーブンを使えるとき、N品の料理を全て作るまでに最短で何分かかりますか？　なお、オーブンを使う時間以外は無視できるものとします。

## 制約
1≤N≤100
1≤Ti​≤10**3
入力に含まれる値は全て整数である

## 入力入力は以下の形式で標準入力から与えられる。
N
T1​ … TN​

## 出力答えを出力せよ。

## 入力例 1
5
8 3 7 2 5

## 出力例 1
13

例えば 2 つのオーブンを次のように使うことで、13 分で全ての料理を作ることができます。
1 つ目のオーブン：料理 5,1 を順に作る。
2 つ目のオーブン：料理 2,4,3 を順に作る。

## 入力例 2
2
1000 1

## 出力例 2
1000

## 入力例 3
9
3 14 15 9 26 5 35 89 79

## 出力例 3
138

=end

require 'prime'

n = gets.chomp.to_i
t = gets.chomp.split.map(&:to_i)

t_sum = t.sum

dp = Array.new(n + 1) { Array.new(t_sum + 1, false) }
dp[0][0] = true

n.times do |i|
  (t_sum + 1).times do |j|
    next unless dp[i][j]

    dp[i + 1][j] = true
    dp[i + 1][j + t[i - 1]] = true
  end
end

print dp

ans = []
(t_sum + 1).times do |i|
  ans << [i, t_sum - i].max if dp[n][i]
end

puts ans.min
