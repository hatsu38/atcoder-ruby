=begin
英小文字のみからなる
N 個の文字列 S 1,S 2,…,S N が与えられます。
1 以上 N 以下の 相異なる 整数
i,j であって、
S iと S j
​をこの順に連結した文字列が回文となるようなものが存在するか判定してください。

ただし、長さ
M の文字列 T が回文であるとは、任意の 1≤i≤M について、
T の i 文字目と (M+1−i) 文字目が一致していることをいいます。

# 入力例
5
ab
ccef
da
a
fe

# 出力例
Yes

=end

require 'prime'
N = gets.chomp.to_i

S = []
N.times do
  S << gets.chomp
end

S.each_with_index do |s, i|
  S.each_with_index do |ss, j|
    next if i == j

    if (s + ss) == (s + ss).reverse
      puts 'Yes'
      exit
    end
  end
end

puts 'No'
