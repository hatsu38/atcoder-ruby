=begin
高橋君は次のような問題を考えました。

3 桁の整数A、B が与えられるのでA−B を求める。
しかしあまりにも簡単すぎるので、ちょっと変更して次のような問題にしました。

3 桁の整数
A、B が与えられる。
A とB のどちらかを1 桁だけ書き換えてもよい時の、A−B の答えになり得る整数の最大値を求める。
なお、一番上の桁が0 であるような整数へと書き換えることはできません。
例えば123 を 023 へと書き換えたりすることはできません。

高橋君は自信満々であなたへとこの問題を出題してきました。 ぜひ挑戦してみてください。

制約
100≤A≤999
100≤B≤999

# 入力例
567 234

# 出力例
733

# 入力例
13 3
13 3 9

# 出力例
6

# 入力例
999 100

# 出力例
899

# 入力例
100 999

# 出力例
-99

=end

require 'prime'

a, b = gets.chomp.split

max_tmp_a = a.to_i
min_tmp_b = b.to_i

3.times do |i|
  tmp = a.dup
  tmp[i] = '9'
  max_tmp_a = tmp if max_tmp_a.to_i < tmp.to_i
end

3.times do |i|
  tmp = b.dup
  tmp[i] = i.zero? ? '1' : '0'
  min_tmp_b = tmp if min_tmp_b.to_i > tmp.to_i
end

puts [(a.to_i - min_tmp_b.to_i), (max_tmp_a.to_i - b.to_i)].max
