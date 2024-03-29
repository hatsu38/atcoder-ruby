=begin
## 問題文
長さLメートルの直線状の木材があります。
x=1,2,…,L−1に対して、木材の左端からxメートルの地点には目印として線xが引かれています。
Q個のクエリが与えられます。
i番目のクエリは数の組(ci​,xi​)によって表されます。
以下の説明に従ってクエリをiの昇順に処理してください。
ci​=1のとき:線xi​がある地点で木材を2つに切る。
ci​=2のとき:線xi​を含む木材を選び、その長さを出力する。
ただしci​=1,2の両方に対して、線xi​はクエリを処理する時点で切られていないことが保証されます。

## 制約
1≤L≤10**9
1≤Q≤2×10**5
ci​=1,2 (1≤i≤Q)
1≤xi​≤L−1 (1≤i≤Q)
全ての i (1≤i≤Q) に対して次が成り立つ: 1≤j<i かつ (cj​,xj​)=(1,xi​) を満たす j は存在しない。
入力は全て整数である。

## 入力入力は以下の形式で標準入力から与えられる。
L Q
c1​ x1​
c2​ x2​
⋮
cQ​ xQ​

## 出力ci​=2 を満たすクエリの回数と等しい行数だけ出力せよ。
j 行目では j 番目のそのようなクエリに対する答えを出力せよ。

## 入力例 1
5 3
2 2
1 3
2 2

## 出力例 1
5
3

1 番目のクエリ時点では木材は一度も切られていないので、線 2 を含む木材の長さは 5 メートルです。よって 5 を出力します。
2 番目のクエリによって、木材は 3 メートルの木材と 2 メートルの木材に分割されます。
3 番目のクエリ時点では 線 2 を含む木材の長さは 3 メートルなので、3 を出力します。

## 入力例 2
5 3
1 2
1 4
2 3

## 出力例 2
2

## 入力例 3
100 10
1 31
2 41
1 59
2 26
1 53
2 58
1 97
2 93
1 23
2 84

## 出力例 3
69
31
6
38
38

=end

require 'prime'

l, q = gets.split.map(&:to_i)

ary = [l]
1.upto(q) do
  c, x = gets.split.map(&:to_i)
  idx = ary.bsearch_index { |b| b >= x } || 0
  if c == 1
    if idx.zero?
      ary.unshift(x)
    else
      ary.insert(idx, x)
    end
  elsif idx.zero?
    puts ary[0]
  else
    puts ary[idx] - ary[idx - 1]
  end
end
