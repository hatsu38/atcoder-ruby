=begin
## 問題文
AtCoder国では、1年がNか月からなる暦を使っています。
i月(1≤i≤N)は、i月1日からi月Di​日までのDi​日からなります。
AtCoder国において、1年のうち日付がゾロ目になる日が何日あるか求めてください。
ただし、i月j日(1≤i≤N,1≤j≤Di​)の日付がゾロ目になるとは、1種類の数字だけを用いてiとjを十進法で表すことができることをいいます。

## 制約
1≤N≤100
1≤Di​≤100 (1≤i≤N)
入力はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N
D1​ D2​ … DN​

## 出力答えを出力せよ。

## 入力例 1
12
31 29 31 30 31 30 31 31 30 31 30 31

## 出力例 1
13

AtCoder 国では、 1 月 1 日、1 月 11 日、2 月 2 日、2 月 22 日、3 月 3 日、4 月 4 日、5 月 5 日、6 月 6 日、7 月 7 日、8 月 8 日、9 月 9 日、11 月 1 日、11 月 11 日の合計 13 日の日付がゾロ目になります。

## 入力例 2
10
10 1 2 3 4 5 6 7 8 100

## 出力例 2
1

AtCoder 国では、1 月 1 日のみが日付がゾロ目になります。

## 入力例 3
30
73 8 55 26 97 48 37 47 35 55 5 17 62 2 60 23 99 73 34 75 7 46 82 84 29 41 32 31 52 32

## 出力例 3
15

=end

require 'prime'

gets.to_i

d_ary = gets.split.map(&:to_i)

count = 0

d_ary.each_with_index do |d, i|
  month = (i + 1).to_s
  (1..d).each do |j|
    sum_s = j.to_s + month
    count += 1 if sum_s.chars.uniq.size == 1
  end
end

puts count
