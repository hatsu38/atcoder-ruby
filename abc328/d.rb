=begin
## 問題文
A,B,Cの3種類の文字のみからなる文字列Sが与えられます。
Sが連続な部分文字列として文字列ABCを含む限り、下記の操作を繰り返します。
Sに連続な部分文字列として含まれる文字列ABCのうち、Sの中で最も左にあるものを、Sから削除する。
上記の手順を行った後の、最終的なSを出力してください。

## 制約
S は A , B , C のみからなる長さ 1 以上 2×10**5 以下の文字列

## 入力入力は以下の形式で標準入力から与えられる。
S

## 出力答えを出力せよ。

## 入力例 1
BAABCBCCABCAC

## 出力例 1
BCAC

与えられた文字列 S= BAABCBCCABCAC に対して、下記の通りに操作が行われます。
1 回目の操作で、S= BAABCBCCABCAC の 3 文字目から 5 文字目の ABC が削除され、その結果 S= BABCCABCAC となります。
2 回目の操作で、S= BABCCABCAC の 2 文字目から 4 文字目の ABC が削除され、その結果 S= BCABCAC となります。
3 回目の操作で、S= BCABCAC の 3 文字目から 5 文字目の ABC が削除され、その結果 S= BCAC となります。
よって、最終的な S は BCAC です。

## 入力例 2
ABCABC

## 出力例 2

この入力例では、最終的な S は空文字列です。

## 入力例 3
AAABCABCABCAABCABCBBBAABCBCCCAAABCBCBCC

## 出力例 3
AAABBBCCC

=end

require 'prime'

# s = gets.chomp

# s.gsub!('ABC', '') while s.include?('ABC')

# puts s

s = gets.chomp
stack = []

s.each_char do |char|
  if char == 'C' && stack[-2..] == %w[A B]
    2.times { stack.pop }
  else
    stack.push(char)
  end
end

puts stack.join
