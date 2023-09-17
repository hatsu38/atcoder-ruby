=begin
## 問題文
文字列Sが与えられます。
このうち8文字を選び下線を引き、下線を引いた文字が左から順にc,h,o,k,u,d,a,iとなるようにする方法は何通りありますか？ただし答えは非常に大きくなる可能性があるので、(10**9+7)で割った余りを出力してください。

## 制約
8≤∣S∣≤10**5
S は英小文字からなる

## 入力入力は以下の形式で標準入力から与えられる。
S

## 出力答えを (10**9+7) で割った余りを出力せよ。

## 入力例 1
chchokudai

## 出力例 1
3

chchokudai
chchokudai
chchokudai
上の 3 つが条件を満たします。
chchokudai
は、条件を満たさないことに注意してください。

## 入力例 2
atcoderrr

## 出力例 2
0

答えが 0 通りになることもあります。

## 入力例 3
chokudaichokudaichokudai

## 出力例 3
45

=end

require 'prime'

s = gets.chomp

chokudai = 'chokudai'

s_length = s.length

dp = Array.new(s_length + 1) { Array.new(8 + 1, 0) }

dp[0][0] = 1

mod_num = (10**9) + 7

s_length.times do |i|
  (8 + 1).times do |j|
    dp[i + 1][j] += dp[i][j]
    dp[i + 1][j] %= mod_num
    if s[i] == chokudai[j]
      dp[i + 1][j + 1] += dp[i][j]
      dp[i + 1][j + 1] %= mod_num
    end
  end
end

puts dp[s_length][8]
