=begin
## 問題文
英小文字からなる長さNの文字列Sが与えられます。
Sの空でない部分文字列であって、1種類の文字のみからなるものの数を求めてください。
ただし、文字列として等しい部分文字列同士は、取り出し方が異なっても区別しません。
なお、Sの空でない部分文字列とは、Sの先頭から0文字以上、末尾から0文字以上削除して得られる文字列のうち、長さが1以上であるもののことをいいます。
例えば、abやabcはabcの空でない部分文字列ですが、acや空文字列はabcの空でない部分文字列ではありません。

## 制約
1≤N≤2×10**5
S は英小文字からなる長さ N の文字列

## 入力入力は以下の形式で標準入力から与えられる。
N
S

## 出力S の空でない部分文字列であって、1 種類の文字のみからなるものの数を出力せよ。

## 入力例 1
6
aaabaa

## 出力例 1
4

S の空でない部分文字列であって、1 種類の文字のみからなるものは a, aa, aaa, b の 4 つです。
S から a や aa を取り出す方法は 1 通りではありませんが、それぞれ 1 回ずつしか数えないことに注意してください。

## 入力例 2
1
x

## 出力例 2
1

## 入力例 3
12
ssskkyskkkky

## 出力例 3
8

=end

require 'prime'

gets.to_i
s = gets.chomp

current_string = s[0]
renzoku_count = 0

s_string_hash = {
  current_string => 0
}

s.chars.each do |c|
  if current_string == c
    renzoku_count += 1
  else
    current_string = c
    renzoku_count = 1
  end

  s_string_hash[current_string] = if s_string_hash[current_string].nil?
                                    renzoku_count
                                  else
                                    [s_string_hash[current_string], renzoku_count].max
                                  end
end

puts s_string_hash.values.sum
