# frozen_string_literal: true

# 英小文字からなる
# N 個の文字列 が与えられます。
# これらのうち一つ以上が and, not, that, the, you のいずれかと一致するなら Yes 、そうでないなら No と出力してください。

# input
# 10
# in that case you should print yes and not no
# ouput
# Yes

gets.chomp.to_i
str = gets.chomp.split

ary = %w[and not that the you]
puts (str & ary).empty? ? 'No' : 'Yes'
