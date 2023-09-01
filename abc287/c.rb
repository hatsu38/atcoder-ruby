=begin
## 問題文
N頂点M辺の単純無向グラフが与えられます。
頂点には1,2,…,Nの番号が、辺には1,2,…,Mの番号が付けられています。
辺i(i=1,2,…,M)は頂点ui​,vi​を結んでいます。
このグラフがパスグラフであるか判定してください。
単純無向グラフとは単純無向グラフとは、自己ループや多重辺を含まず、辺に向きの無いグラフのことをいいます。

パスグラフとは頂点に1,2,…,Nの番号が付けられたN頂点のグラフがパスグラフであるとは、(1,2,…,N)を並べ変えて得られる数列(v1​,v2​,…,vN​)であって、以下の条件を満たすものが存在することをいいます。
全てのi=1,2,…,N−1に対して、頂点vi​,vi+1​を結ぶ辺が存在する整数i,jが1≤i,j≤N,∣i−j∣≥2を満たすならば、頂点vi​,vj​を結ぶ辺は存在しない

## 制約
2≤N≤2×10**5
0≤M≤2×10**5
1≤ui​,vi​≤N(i=1,2,…,M)
入力される値は全て整数
入力で与えられるグラフは単純

## 入力入力は以下の形式で標準入力から与えられる。
N M
u1​ v1​
u2​ v2​
⋮
uM​ vM​

## 出力与えられたグラフがパスグラフなら Yes、そうでないなら No と出力せよ。

## 入力例 1
4 3
1 3
4 2
3 2

## 出力例 1
Yes

与えらえたグラフは下図のようであり、これはパスグラフです。

## 入力例 2
2 0

## 出力例 2
No

与えらえたグラフは下図のようであり、これはパスグラフではありません。

## 入力例 3
5 5
1 2
2 3
3 4
4 5
5 1

## 出力例 3
No

与えらえたグラフは下図のようであり、これはパスグラフではありません。
=end

require 'prime'

n, m = gets.split.map(&:to_i)

edges = Array.new(n + 1) { [] }

m.times do
  u, v = gets.split.map(&:to_i)
  edges[u] << v
  edges[v] << u
end

def connected?(edges, n)
  visited = Array.new(n + 1, false)
  visited[1] = true
  stack = [1]
  skipped_edges = 0

  until stack.empty?
    current = stack.pop
    edges[current].each do |neighbor|
      if visited[neighbor]
        skipped_edges += 1
        next
      end
      visited[neighbor] = true
      stack << neighbor
    end
  end
  skipped_edges == n - 1
end

def path_graph?(edges, n, m)
  return false unless m == n - 1
  return false if edges.any? { |neighbors| neighbors.size > 2 }

  connected?(edges, n)
end

puts path_graph?(edges, n, m) ? 'Yes' : 'No'
