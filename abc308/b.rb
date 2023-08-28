=begin
高橋くんは回転寿司で
N 皿の料理を食べました。
i 皿目の色は文字列 C iで表されます。

また、料理の価格は皿の色と対応し、
i=1,…,M のそれぞれについて、色が文字列 D iの皿の料理は一皿 P i円です。
また、D 1,…,D Mのいずれとも異なる色の皿の料理は一皿 P0円です。

高橋くんが食べた料理の価格の合計を求めてください。

# 入力例
3 2
red green blue
blue red
800 1600 2800

# 出力例
5200

=end

require 'prime'
N, M = gets.chomp.split.map(&:to_i)

C = gets.chomp.split # 食べたN皿の料理の色
D = gets.chomp.split # 価格が決まっているM皿の料理の色

P = gets.chomp.split.map(&:to_i) # 価格が決まっているM皿の料理の価格

P0 = P[0] # 価格が決まっていない料理の価格

# 料理の色と価格をハッシュに格納
dish = {}
D.each_with_index do |d, i|
  dish[d] = P[i + 1]
end

# 値段の計算
sum = 0
C.each do |c|
  sum += dish[c] || P0
end

puts sum
