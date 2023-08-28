# frozen_string_literal: true

# 問題文
# 長さ
# N の数列
# A=(A
# 1
# ​
#  ,…,A
# N
# ​
#  ) が与えられます。

# 1≤i,j≤N である組
# (i,j) であって、
# A
# i
# ​
#  −A
# j
# ​
#  =X となるものが存在するかどうか判定してください。

# 制約
# 2≤N≤2×10
# 5

# −10
# 9
#  ≤A
# i
# ​
#  ≤10
# 9

# −10
# 9
#  ≤X≤10
# 9

# 入力は全て整数である
# 入力
# 入力は以下の形式で標準入力から与えられる。

# N
# X
# A
# 1
# ​

# …
# A
# N
# ​

# 出力
# 1≤i,j≤N である組
# (i,j) であって、
# A
# i
# ​
#  −A
# j
# ​
#  =X となるものが存在するとき Yes、存在しないとき No と出力せよ。
# 入力例
# 6 5
# 3 1 4 1 5 9
# 出力例
# Yes

_, w = gets.chomp.split.map(&:to_i)
str = gets.chomp.split.map(&:to_i)

hash = Hash.new(0)

str.each do |num|
  hash[num] = true
  if hash[num + w]
    puts 'Yes'
    exit
  end
end

puts 'No'
