=begin
ある地方に、1 からN の番号がついたN 個の街と、1 からM の番号がついたM 本の道路があります。
i 番目の道路は街Aiと街Bjを双方向に結び、長さはCiです。

好きな街からスタートして同じ街を二度以上通らずに別の街へ移動するときの、通る道路の長さの和としてありえる最大値を求めてください。

制約
2≤N≤10
1≤M≤ N(N−1) / 2
1≤Ai<Bi≤N
(Ai,Bi) は相異なる
1≤Ci≤10**8

入力は全て整数である

# 入力例
4 4
1 2 1
2 3 10
1 3 100
1 4 1000

# 出力例
1110

# 入力例
10 1
5 9 1

# 出力例
1

# 入力例
10 13
1 2 1
1 10 1
2 3 1
3 4 4
4 7 2
4 8 1
5 8 1
5 9 3
6 8 1
6 9 5
7 8 1
7 9 4
9 10 3

# 出力例
20

=end

require 'prime'

# N, M = gets.chomp.split.map(&:to_i)

# LENGTH_HASH = {}

# ROAD_HASH = {}

# M.times do |_i|
#   a, b, c = gets.chomp.split.map(&:to_i)
#   LENGTH_HASH[[a, b]] = c
#   LENGTH_HASH[[b, a]] = c

#   ROAD_HASH[a] ||= []
#   ROAD_HASH[a] << b

#   ROAD_HASH[b] ||= []
#   ROAD_HASH[b] << a
# end

# @tmp_max = 0

# ARRVIED_TOWNS_COST_HASH = {}

# def dfs(town, length)
#   if @arrived_town.include?(town)
#     ARRVIED_TOWNS_COST_HASH[@arrived_town] = @current_length
#     return
#   end
#   @arrived_town << town

#   @current_length += length

#   @tmp_max = @current_length if @current_length > @tmp_max
#   ROAD_HASH[town].each do |next_town|
#     dfs(next_town, LENGTH_HASH[[town, next_town]])
#   end
#   @arrived_town.pop
#   @current_length -= length
# end

# ROAD_HASH.each_key do |town|
#   @current_length = 0
#   @arrived_town = []
#   @arrived_town << town
#   ROAD_HASH[town].each do |next_town|
#     dfs(next_town, LENGTH_HASH[[town, next_town]])
#   end
# end

# puts @tmp_max

n, m = gets.split.map(&:to_i)
edges = Array.new(n) { [] }

m.times do
  a, b, c = gets.split.map(&:to_i)
  edges[a - 1] << [b - 1, c]
  edges[b - 1] << [a - 1, c]
end

def dfs(tmp_node, visited_bit, edges, cost)
  visited_bit |= 1 << tmp_node
  @dfs_cache[tmp_node] ||= {}
  return @dfs_cache[tmp_node][visited_bit] + cost if @dfs_cache[tmp_node][visited_bit]

  max_cost = cost
  edges[tmp_node].each do |v, c|
    next if visited_bit[v] == 1

    tmp_cost = dfs(v, visited_bit, edges, cost + c)
    max_cost = tmp_cost if max_cost < tmp_cost
  end
  @dfs_cache[tmp_node][visited_bit] = max_cost - cost
  max_cost
end

ans = 0
@dfs_cache = []
n.times do |start|
  tmp_answer = dfs(start, 0, edges, 0)
  ans = tmp_answer if ans < tmp_answer
end
puts ans
