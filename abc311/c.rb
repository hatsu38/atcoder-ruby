=begin
N 頂点 N 辺の有向グラフがあります。
i 番目の辺は頂点 i から 頂点 A iに伸びます。
( i ≠ Aiであることは制約より保証されます )
同一頂点を複数回含まない有向閉路をひとつ求めてください。
なお、この問題の制約下で答えが存在することが示せます。

この問題では、有向閉路とは以下の条件を全て満たす頂点の列
B=(B 1,B 2,…,B M) であるとします。

制約
M≥2
Biから Bi+1に辺が伸びている。 ( 1≤i≤M−1 )
BMから B1に辺が伸びている。
i≠j ならば Bi≠Bj

# 入力例
7
6 7 2 1 3 4 5

# 出力例
4
7 5 3 2

# 入力例
2
2 1

# 出力例
2
1 2

# 入力例
8
3 7 4 7 3 3 8 2

# 出力例
3
2 7 8

=end

require 'prime'

N = gets.chomp.to_i
@a_hash = {}

gets.chomp.split.each_with_index do |a, i|
  @a_hash[i + 1] =
    a.to_i
end

def find_cycle(
  ans, visited_hash, start
)
  visited_hash[start] =
    true
  next_node = @a_hash[start]

  if visited_hash[next_node]
    index = ans.find_index(next_node)
    return if index.nil?

    result = ans[index..]
    puts result.size
    puts result.join(' ')
    exit
  else
    ans << next_node
    find_cycle(
      ans, visited_hash, next_node
    )
  end
end

@a_hash.each_key do |k|
  ans = [k]
  visited_hash = {}
  find_cycle(
    ans, visited_hash, k
  )
end
