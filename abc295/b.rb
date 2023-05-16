# 問題文
# 縦 
# R 行横 
# C 列の盤面があります。上から 
# i 行目、左から 
# j 列目のマスを 
# (i,j) と表します。

# (i,j) の現在の状態が文字 
# B 
# i,j
# ​
#   として与えられます。 . は空きマス、# は壁があるマスを表し、 1, 2,
# …, 9 はそれぞれ威力 
# 1,2,…,9 の爆弾があるマスを表します。

# 次の瞬間に、全ての爆弾が同時に爆発します。 爆弾が爆発すると、爆弾があるマスからのマンハッタン距離がその爆弾の威力以下であるような全てのマス（その爆弾があるマス自体を含む）が空きマスに変わります。 ここで、
# (r 
# 1
# ​
#  ,c 
# 1
# ​
#  ) から 
# (r 
# 2
# ​
#  ,c 
# 2
# ​
#  ) までのマンハッタン距離は 
# ∣r 
# 1
# ​
#  −r 
# 2
# ​
#  ∣+∣c 
# 1
# ​
#  −c 
# 2
# ​
#  ∣ です。

# 爆発後の盤面を出力してください。
# 例
# input
# 4 4
# .1.#
# ###.
# .#2.
# #.##

# output
# ...#
# #...
# ....
# #...
require "pry"

m, w = gets.chomp.split(' ').map(&:to_i)
str = Array.new(m) { gets.chomp.split('') }

puts "======"

ans = str.map(&:dup)

str.each_with_index do |s, i|
  s.each_with_index do |ss, j|
    if ss == '.' || ans[i][j] == '.'
      ans[i][j] = '.'
    elsif ss == '#'
      ans[i][j] = '#'
    else
      int = ss.to_i
      ans[i][j] = '.'
      [(j - int), 0].max.upto([(j + int), w - 1].min) do |k|
        ans[i][k] = '.'
      end
      [(i - int), 0].max.upto([(i + int), m - 1].min) do |k|
        ans[k][j] = '.'
      end
    end
  end
end

ans.each do |a|
  puts a.join('')
end
