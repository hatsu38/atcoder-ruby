=begin

英小文字からなる文字列
S が与えられます。
S から a, e, i, o, u をすべて取り除いて得られる文字列を出力してください。
なお、
S は a, e, i, o, u 以外の文字を一つ以上含みます。

制約

# 入力例
atcoder

# 出力例
tcdr

# 入力例
2 1
aa
1 1

# 出力例
aa

=end

require 'prime'

S = gets.chomp

puts S.gsub(/[aeiou]/, '')
