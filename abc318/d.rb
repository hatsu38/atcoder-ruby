=begin
## 問題文
頂点に1からNの番号が付いたN頂点の重み付き無向完全グラフが与えられます。
頂点iと頂点j (i<j)を結ぶ辺の重みはDi,j​です。
以下の条件を満たすように何本かの辺を選ぶとき、選んだ辺の重みの総和としてあり得る最大値を求めてください。
選んだ辺の端点はどの2個も相異なる。

## 制約
2≤N≤16
1≤Di,j​≤10**9
入力される数値は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N
D1,2​ D1,3​ … D1,N​
D2,3​ … D2,N​
⋮
DN−1,N​

## 出力答えを整数として出力せよ。

## 入力例 1
4
1 5 4
7 8
6

## 出力例 1
13

頂点 1 と頂点 3 を結ぶ辺、頂点 2 と頂点 4 を結ぶ辺を選ぶと、辺の重みの総和が 5+8=13 となります。
これが達成可能な最大値であることが示せます。

## 入力例 2
3
1 2
3

## 出力例 2
3

N が奇数の場合もあります。

## 入力例 3
16
5 6 5 2 1 7 9 7 2 5 5 2 4 7 6
8 7 7 9 8 1 9 6 10 8 8 6 10 3
10 5 8 1 10 7 8 4 8 6 5 1 10
7 4 1 4 5 4 5 10 1 5 1 2
2 9 9 7 6 2 2 8 3 5 2
9 10 3 1 1 2 10 7 7 5
10 6 1 8 9 3 2 4 2
10 10 8 9 2 10 7 9
5 8 8 7 5 8 2
4 2 2 6 8 3
2 7 3 10 3
5 7 10 3
8 5 7
9 1
4

## 出力例 3
75

=end

require 'prime'

## DPでの回答
# n = gets.chomp.to_i
# d = Array.new(n) { Array.new(n) }

# (n - 1).times do |i|
#   d_ary = gets.chomp.split.map(&:to_i)
#   d[i][i] = 0
#   d_ary.each_with_index do |val, j|
#     d[i][i + j + 1] = val
#     d[i + j + 1][i] = val
#   end
# end
# d[n - 1][n - 1] = 0

# dp = Array.new(1 << n, 0)

# (1 << n).times do |mask|
#   n.times do |i|
#     (i + 1...n).each do |j|
#       dp[mask] = [dp[mask], dp[mask ^ (1 << i) ^ (1 << j)] + d[i][j]].max if (mask & (1 << i)).positive? && (mask & (1 << j)).positive?
#     end
#   end
# end

# puts dp[(1 << n) - 1]

## DFSでの回答

# =begin
@n = gets.to_i
@d_ary = Array.new(@n) { Array.new(@n, 0) }

(@n - 1).times do |i|
  d = gets.split.map(&:to_i)
  (i + 1...@n).each do |j|
    @d_ary[i][j] = @d_ary[j][i] = d[j - i - 1]
  end
end

def dfs(used)
  return 0 if used.all?

  v = used.index(false)
  used[v] = true
  ret = 0
  (v + 1...@n).each do |w|
    next if used[w]

    used[w] = true
    ret = [ret, @d_ary[v][w] + dfs(used)].max
    used[w] = false
  end
  used[v] = false
  ret
end

used = Array.new(@n, false)

ans = 0
if @n.even?
  ans = dfs(used)
else
  @n.times do |v|
    used[v] = true
    ans = [ans, dfs(used)].max
    used[v] = false
  end
end

puts ans
# =end
