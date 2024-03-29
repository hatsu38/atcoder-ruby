=begin
## 問題文
整数Nが与えられるので、以下の条件を全て満たす整数Xの個数を998244353で割った余りを求めてください。
N桁の正整数である。
Xの各桁を上の位から順にX1​,X2​,…,XN​とする。
このとき以下の条件を全て満たす。
全ての整数1≤i≤Nに対して、1≤Xi​≤9全ての整数1≤i≤N−1に対して、∣Xi​−Xi+1​∣≤1

## 制約
N は整数
2≤N≤10**6

## 入力入力は以下の形式で標準入力から与えられる。
N

## 出力答えを整数として出力せよ。

## 入力例 1
4

## 出力例 1
203

4 桁の整数として、例えば 1111,1234,7878,6545 が問題文中の条件を満たします。

## 入力例 2
2

## 出力例 2
25

## 入力例 3
1000000

## 出力例 3
248860093

998244353 で割った余りを求めることに注意してください。
=end

require 'prime'

MOD = 998_244_353

n = gets.to_i
dp = Array.new(n + 1) { Array.new(11, 0) }

(1..9).each { |d| dp[1][d] = 1 }

2.upto(n) do |i|
  1.upto(9) do |d|
    dp[i][d] = (dp[i - 1][d - 1] + dp[i - 1][d] + dp[i - 1][d + 1]) % MOD
  end
end

puts dp[-1].sum % MOD
