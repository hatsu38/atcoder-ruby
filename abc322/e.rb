=begin
## 問題文
AtCoder社はある商品の開発をしようとしています。
この商品にはK個のパラメーターがあり、現段階ではすべてのパラメーターの値が0です。
AtCoder社の目標は、パラメーターの値を全てP以上にすることです。
ここで、N個の開発案があります。
i(1≤i≤N)個目の開発案を実行すると、1≤j≤Kを満たす整数j全てに対してj個目のパラメーターがAi,j​上がりますが、この開発案を実行するにはコストがCi​かかります。
同じ開発案を2回以上実行することは出来ません。
AtCoder社が目標を達成出来るか判定し、出来る場合は目標を達成するのに必要なコストの総和の最小値を求めてください。

## 制約
1≤N≤100
1≤K,P≤5
0≤Ai,j​≤P(1≤i≤N,1≤j≤K)
1≤Ci​≤10**9(1≤i≤N)
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N K P
C1​ A1,1​ A1,2​ … A1,K​
C2​ A2,1​ A2,2​ … A2,K​
…
CN​ AN,1​ AN,2​ … AN,K​

## 出力AtCoder 社が目標を達成出来るならば目標を達成するのに必要なコストの総和の最小値を、出来ないならば -1 を出力せよ。

## 入力例 1
4 3 5
5 3 0 2
3 1 2 3
3 2 4 0
1 0 1 4

## 出力例 1
9

1 個目と 3 個目と 4 個目の開発案を実行すると、それぞれのパラメーターが 3+2+0=5,0+4+1=5,2+0+4=6 で全て 5 以上となるため目標を達成できます。この場合コストの総和は 5+3+1=9 となります。
コストの総和 8 以下で目標を達成することは出来ません。よって答えは 9 です。

## 入力例 2
7 3 5
85 1 0 1
37 1 1 0
38 2 0 0
45 0 2 2
67 1 1 0
12 2 2 0
94 2 2 1

## 出力例 2
-1

どのようにしても目標を達成することは出来ません。よって -1 を出力します。
=end

require 'prime'

# frozen_string_literal: true

n, k, p = gets.split.map(&:to_i)
ca = Array.new(n) { gets.split.map(&:to_i) }

max_coordinate = 0
k.times do
  max_coordinate *= p + 1
  max_coordinate += p
end

dp = Array.new(n + 1) { Array.new(max_coordinate + 1, 10**12) }

(n + 1).times do |i|
  dp[i][0] = 0
end
n.times do |i|
  c = ca[i][0]
  a = ca[i][1..]
  (max_coordinate + 1).times do |j|
    np = 0
    k.times do |l|
      np *= (p + 1)
      cp = (j / ((p + 1)**(k - 1 - l))) % (p + 1)
      np += [cp + a[l], p].min
    end
    dp[i + 1][j] = [dp[i + 1][j], dp[i][j]].min
    dp[i + 1][np] = [dp[i + 1][np], dp[i][j] + c].min
  end
end
puts dp[n][max_coordinate] == 10**12 ? '-1' : dp[n][max_coordinate]
