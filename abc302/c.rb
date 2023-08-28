# frozen_string_literal: true

# 英小文字からなる長さ
# M の文字列
# N 個
# S
# 1
# ​
#  ,S
# 2
# ​
#  ,…,S
# N
# ​
#   が与えられます。ここで、
# S
# i
# ​
#   は互いに異なります。

# これらを並び替えた文字列の列
# T1 ,T2,…,TN
# ​であって、以下の条件を満たすものが存在するか判定してください。
# 1≤i≤N−1 を満たす全ての整数
# i に対して、Tiを 1 文字だけ別の英小文字に変えて
# T i+1 にすることが出来る。
# 2≤N≤8
# 1≤M≤5
# Si​は英小文字からなる長さ
# M の文字列である。
# (1≤i≤N)
# S i
# ​は互いに異なる。

# 入力例
# 4 4
# bbed
# abcd
# abed
# fbed

# 出力例
# Yes

n, m = gets.chomp.split.map(&:to_i)
S = Array.new(n) { gets.to_s.chomp }

S.permutation(n).each do |s|
  flag = false
  (n - 1).times do |i|
    cnt = 0
    m.times do |j|
      cnt += 1 if s[i][j] != s[i + 1][j]
    end
    break if cnt != 1

    flag = true if i == n - 2
  end

  return puts 'Yes' if flag
end

puts 'No'
