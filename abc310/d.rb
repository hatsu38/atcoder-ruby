=begin
N 人のスポーツ選手がいます。
N 人の選手たちには互いに相性の悪い選手のペアが M 組あり、
相性の悪い組のうち i (1≤i≤M) 組目は A i番目の選手と B i番目の選手です。
あなたは、選手を T チームに分けます。
どの選手もちょうど一つのチームに属さなければならず、どのチームにも少なくとも一人の選手が属さなければなりません。
さらに、どの i=1,2,…,M についても、 A i番目の選手と B i番目の選手が同じチームに属していてはいけません。
この条件を満たすチーム分けの方法は何通りあるか求めてください。
ただし、チーム分けの方法が異なるとは、ある二人が存在して、彼らが一方のチーム分けでは同じチームに所属し、
もう一方では異なるチームに所属することをいいます。

制約
1≤T≤N≤10
0≤M≤ N(N−1) / 2
1≤Ai<Bi≤N (1≤i≤M)
(A i,B i) /=(A j,B j) (1≤i<j≤M)
入力はすべて整数

# 入力例
5 2 2
1 3
3 4

# 出力例
4

# 入力例
5 1 2
1 3
3 4

# 出力例
0

# 入力例
6 4 0

# 出力例
65

# 入力例
10 6 8
5 9
1 4
3 8
1 6
4 10
5 7
5 6
3 7

# 出力例
8001

=end

require 'prime'

N, T, M = gets.split.map(&:to_i)
HATE = Array.new(N + 1) { [] }

M.times do
  a, b = gets.split.map { |x| x.to_i.pred }
  HATE[a] << b
  HATE[b] << a
end

@ans = 0
def dfs(i, teams)
  if i == N
    @ans += 1 if teams.size == T
    return
  end
  teams.each_with_index do |t, j|
    next if (t & HATE[i]).size.positive?

    teams_copy = teams.map(&:clone)
    teams_copy[j] << i
    dfs(i + 1, teams_copy)
  end
  return if teams.size >= T

  dfs(i + 1, teams + [[i]])
end

dfs(1, [[0]])

puts @ans
