# frozen_string_literal: true

# 正整数
# N,M が与えられます。
# 次の条件をともにみたす最小の正整数
# X を求めてください。 ただし、そのようなものが存在しない場合は
# −1 を出力してください。

# X は
# 1 以上
# N 以下の整数
# a,b の積として表される。ここで、
# a と
# b は同じ整数でも良い。
# X は
# M 以上である。
# 制約
# 1≤N≤10 ** 12
# 1≤M≤10 ** 12
# N,M は整数
# 入力
# 入力は以下の形式で標準入力から与えられる。

# N M
# 出力
# 問題文の条件をともにみたす最小の正整数
# X を出力せよ。そのようなものが存在しない場合は
# −1 を出力せよ。

# 入力例
# 5 7
# 出力例
# 8

gets.chomp.split.map(&:to_i)
gets.chomp.to_i
