=begin
## 問題文
長さNの数列A=(A1​,A2​,…,AN​)が与えられます。
以下のQ個のクエリに、与えられる順番で対応してください。
k番目のクエリは以下の形式で与えられます。
ik​xk​
まず、Aik​​=xk​と変更する。
この変更は以降のクエリにも引き継がれる。
その後、Aのmexを出力する。
Aのmexとは、Aに含まれない最小の非負整数を指す。

## 制約
入力は全て整数
1≤N,Q≤2×10**5
0≤Ai​≤10**9
1≤ik​≤N
0≤xk​≤10**9

## 入力入力は以下の形式で標準入力から与えられる。
N Q
A1​ A2​ … AN​
i1​ x1​
i2​ x2​
⋮
iQ​ xQ​

## 出力全体で Q 行出力せよ。
そのうち k 行目には k 番目のクエリに対する答えを整数として出力せよ。

## 入力例 1
8 5
2 0 2 2 1 1 2 5
4 3
4 4
6 3
8 1000000000
2 1

## 出力例 1
4
3
6
5
0

最初、数列 A は (2,0,2,2,1,1,2,5) です。
この入力では、 5 つのクエリを処理します。
1 番目のクエリで A4​=3 と変更し、 A=(2,0,2,3,1,1,2,5) となりました。
この時点で、 A の mex は 4 です。
2 番目のクエリで A4​=4 と変更し、 A=(2,0,2,4,1,1,2,5) となりました。
この時点で、 A の mex は 3 です。
3 番目のクエリで A6​=3 と変更し、 A=(2,0,2,4,1,3,2,5) となりました。
この時点で、 A の mex は 6 です。
4 番目のクエリで A8​=1000000000 と変更し、 A=(2,0,2,4,1,3,2,1000000000) となりました。
この時点で、 A の mex は 5 です。
5 番目のクエリで A2​=1 と変更し、 A=(2,1,2,4,1,3,2,1000000000) となりました。
この時点で、 A の mex は 0 です。

=end

require 'prime'

require 'set'

def _min(a, b)
  [a, b].min
end

def _max(a, b)
  [a, b].max
end

class BinaryTree
  attr_reader :size

  def initialize
    @offset = @size = (1 << 18)
    @data = Array.new(@offset + @size, 0)
  end

  def add(i, x)
    return if i >= @size

    k = @offset + i
    @data[k] += x
    @data[k] = _min(@data[2 * k], @data[(2 * k) + 1]) while (k >>= 1).positive?
  end

  def mex
    k = 1
    while k < @offset
      k <<= 1
      k += 1 if (@data[k]).positive?
    end
    k - @offset
  end
end
N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
bt = BinaryTree.new
A.each { |a| bt.add(a, 1) }
ans = Array.new(Q) do
  i, x = gets.split.map(&:to_i)
  i -= 1
  a = A[i]
  bt.add(a, -1)
  A[i] = x
  bt.add(x, 1)
  bt.mex
end
puts ans
