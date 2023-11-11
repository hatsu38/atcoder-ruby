=begin
## 問題文
頂点に1からNの番号が、辺に1からMの番号がついたN頂点M辺の重み付き単純連結無向グラフと正整数Kが与えられます。
辺i (1≤i≤M)は頂点ui​​と頂点vi​を結んでおり、重みはwi​です。
このグラフの全域木Tに対して、TのコストをTに含まれる辺の重みの総和をKで割ったあまりで定めます。
このグラフの全域木のコストの最小値を求めてください。

## 制約
2≤N≤8
N−1≤M≤2N(N−1)​
1≤K≤10**15
1≤ui​<vi​≤N (1≤i≤M)
0≤wi​<K (1≤i≤M)
与えられるグラフは単純かつ連結
入力はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N M K
u1​ v1​ w1​
u2​ v2​ w2​
⋮
uM​ vM​ wM​

## 出力答えを出力せよ。

## 入力例 1
5 6 328
1 2 99
1 3 102
2 3 86
2 4 94
2 5 95
3 4 81

## 出力例 1
33

与えられるグラフは次のようになります。
辺 1,3,5,6 の 4 本を含む全域木のコストは (99+86+81+95)mod328=361mod328=33 となります。
このグラフの全域木のコストはすべて 33 以上であるため、33 を出力してください。

## 入力例 2
6 5 998244353
1 2 337361568
1 6 450343304
2 3 61477244
2 5 745383438
4 5 727360840

## 出力例 2
325437688

このグラフのただ一つの全域木のコスト 325437688 を出力してください。

## 入力例 3
8 28 936294041850197
1 2 473294720906780
1 3 743030800139244
1 4 709363019414774
1 5 383643612490312
1 6 557102781022861
1 7 623179288538138
1 8 739618599410809
2 3 857687812294404
2 4 893923168139714
2 5 581822471860662
2 6 740549363586558
2 7 307226438833222
2 8 447399029952998
3 4 636318083622768
3 5 44548707643622
3 6 307262781240755
3 7 12070267388230
3 8 700247263184082
4 5 560567890325333
4 6 704726113717147
4 7 588263818615687
4 8 549007536393172
5 6 779230871080408
5 7 825982583786498
5 8 713928998174272
6 7 751331074538826
6 8 449873635430228
7 8 11298381761479

## 出力例 3
11360716373

入力や答えが 32bit 整数に収まらない場合があることに注意してください。
=end

require 'prime'

N, M, K = gets.split.map(&:to_i)

edges = Array.new(M) do
  u, v, w = gets.split.map(&:to_i)
  [u - 1, v - 1, w]
end.sort_by { |e| e[2] }

class UnionFind
  def initialize(size)
    @rank = Array.new(size, 0)
    @parent = Array.new(size, &:itself)
  end

  def unite(id_x, id_y)
    x_parent = get_parent(id_x)
    y_parent = get_parent(id_y)
    return if x_parent == y_parent

    if @rank[x_parent] > @rank[y_parent]
      @parent[y_parent] = x_parent
    else
      @parent[x_parent] = y_parent
      @rank[y_parent] += 1 if @rank[x_parent] == @rank[y_parent]
    end
  end

  def get_parent(id_x)
    @parent[id_x] == id_x ? id_x : (@parent[id_x] = get_parent(@parent[id_x]))
  end

  def same_parent?(id_x, id_y)
    get_parent(id_x) == get_parent(id_y)
  end
end

ans = nil
edges.combination(N - 1).each do |arr|
  uf = UnionFind.new(N)
  tmp = 0
  ok = arr.each do |u, v, w|
    break false if uf.same_parent?(u, v)

    uf.unite(u, v)
    tmp += w
    tmp %= K
  end

  next unless ok

  if ans.nil?
    ans = tmp
  elsif tmp < ans
    ans = tmp
  end
end

puts ans % K
