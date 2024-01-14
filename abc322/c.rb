=begin
## 問題文
AtCoder王国では、これからN日間のお祭りが開催されます。
そのうち、A1​日目、A2​日目、…、AM​日目のM日では花火が上がります。
ここで、お祭りの最終日には花火が上がることが保証されます。
(つまり、AM​=Nが保証されます。)i=1,2,…,Nに対して、以下の問題を解いてください。
i日目以降で初めて花火が上がるのは、i日目から数えて何日後か？ただし、i日目に花火が上がる場合0日後とする。

## 制約
1≤M≤N≤2×10**5
1≤A1​<A2​<⋯<AM​=N
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N M
A1​ A2​ … AM​

## 出力N 行出力せよ。
i(1≤i≤N) 行目には、i 日目以降で初めて花火が上がるのは、i 日目から数えて何日後かを整数として出力せよ。

## 入力例 1
3 2
2 3

## 出力例 1
1
0
0

AtCoder 王国ではお祭りを 3 日間開催し、2,3 日目に花火が上がります。
1 日目以降で初めて花火が上がるのは 2 日目なので、1 日目から数えて 1 日後です。
2 日目以降で初めて花火が上がるのは 2 日目なので、2 日目から数えて 0 日後です。
3 日目以降で初めて花火が上がるのは 3 日目なので、3 日目から数えて 0 日後です。

## 入力例 2
8 5
1 3 4 7 8

## 出力例 2
0
1
0
0
2
1
0
0

=end

require 'prime'

n, = gets.split.map(&:to_i)

a_ary = gets.split.map(&:to_i)

current_day = a_ary.shift

1.upto(n) do |i|
  current_day = a_ary.shift if i > current_day

  puts current_day - i
end