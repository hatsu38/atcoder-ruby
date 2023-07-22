=begin
1 から N までの番号がついた N 人の人がいます。
N 人の人の今後 D 日間の予定が与えられます。
人 i の予定は長さ D の文字列 S iで表されて、S iの j 文字目が o ならば j 日目は暇であることを、x ならばそうでないことを意味します。
D 日間のうち全員が暇であるような 連続する 何日かを選ぶことを考えます。
選べる日数は最大で何日ですか？ただし、選べる日が存在しない場合は 0 日と答えてください。

# input
3 5
xooox
oooxx
oooxo

# output
2

# input
3 3
oxo
oxo
oxo

# output
1

# input
3 3
oox
oxo
xoo

# output
0

# input
1 7
ooooooo

# output
7

# input
5 15
oxooooooooooooo
oxooxooooooooox
oxoooooooooooox
oxxxooooooxooox
oxooooooooxooox

# output
5

=end

require 'prime'
N, D = gets.chomp.split.map(&:to_i)
s_hash = {}
N.times do |i|
  s = gets.chomp.chars
  s_hash[i] =
    {}
  s.each_with_index do |c, j|
    s_hash[i][j] =
      c
  end
end

max = 0
consecutive = 0

D.times do |i| # 文字数
  count = 0
  N.times do |j| # 人数
    count += 1 if s_hash[j][i] == 'o'
  end
  if count == N
    consecutive += 1
    max = consecutive if consecutive > max
  else
    consecutive = 0
  end
end

puts max
