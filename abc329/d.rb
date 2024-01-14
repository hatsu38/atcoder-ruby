=begin
## 問題文
1,2,…,Nの番号のついたN人の候補者から当選者を1人選ぶ選挙において、M票の投票がありました。
各票ではそれぞれちょうど1人が投票先として選ばれており、i票目の投票先は候補者Ai​です。
これから1票目から順に開票を行い、1票ごとにその時点で開票が終了した場合の当選者を更新して表示します。
開票された票において最も得票数が多かった候補者が当選となります。
ただし、最も得票数が多かった候補者が複数いる場合は、その中で最も番号の小さい候補者が当選となります。
各i=1,2,…,Mについて、1,2,…,i票目のみを開票した場合の当選者を求めてください。

## 制約
1≤N,M≤200000
1≤Ai​≤N
入力される数値はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N M
A1​ A2​ … AM​

## 出力M 行出力せよ。
i 行目には 1,2,…,i 票目のみを開票した場合の当選者の番号を出力せよ。

## 入力例 1
3 7
1 2 2 3 1 3 3

## 出力例 1
1
1
2
2
1
1
3

候補者 i の得票数を Ci​ で表すこととします。
1 票目までが開票された時点では、(C1​,C2​,C3​)=(1,0,0) なので当選者は 1 です。
2 票目までが開票された時点では、(C1​,C2​,C3​)=(1,1,0) なので当選者は 1 です。
3 票目までが開票された時点では、(C1​,C2​,C3​)=(1,2,0) なので当選者は 2 です。
4 票目までが開票された時点では、(C1​,C2​,C3​)=(1,2,1) なので当選者は 2 です。
5 票目までが開票された時点では、(C1​,C2​,C3​)=(2,2,1) なので当選者は 1 です。
6 票目までが開票された時点では、(C1​,C2​,C3​)=(2,2,2) なので当選者は 1 です。
7 票目までが開票された時点では、(C1​,C2​,C3​)=(2,2,3) なので当選者は 3 です。

## 入力例 2
100 5
100 90 80 70 60

## 出力例 2
100
90
80
70
60

## 入力例 3
9 8
8 8 2 2 8 8 2 2

## 出力例 3
8
8
8
2
8
8
8
2

=end

require 'prime'

n, = gets.split.map(&:to_i)
votes = gets.split.map(&:to_i)

vote_counts = Array.new(n, 0)

max_votes = 0
current_winner = 1

votes.each do |vote|
  vote_counts[vote - 1] += 1
  if vote_counts[vote - 1] > max_votes || (vote_counts[vote - 1] == max_votes && vote < current_winner)
    max_votes = vote_counts[vote - 1]
    current_winner = vote
  end

  puts current_winner
end