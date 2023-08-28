# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split.map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 問題文
# N 人が一列に並んでいます。列の状態は長さ
# N の文字列
# S で与えられ、前から
# i 番目の人は
# S の
# i 文字目が M のとき男性、F のとき女性です。

# 男女が交互に並んでいるかどうか判定してください。

# 男性同士が隣り合う箇所も女性同士が隣り合う箇所も存在しないとき、かつ、そのときに限り、男女が交互に並んでいるといいます。

# 制約
# 1≤N≤100
# N は整数である
# S は M および F のみからなる長さ
# N の文字列である
# 入力
# 入力は以下の形式で標準入力から与えられる。

# N
# S
# 出力
# 男女が交互に並んでいるとき Yes、そうでないとき No と出力せよ。

# 入力例
# 6
# MFMFMF
# 出力例
# Yes

gets.chomp
str = gets.chomp

if str.include?('MM') || str.include?('FF')
  puts 'No'
else
  puts 'Yes'
end
