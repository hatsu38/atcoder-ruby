=begin
## 問題文
英大文字からなる文字列Sが与えられます。
Sの部分文字列(注記を参照)であるような最も長いACGT文字列の長さを求めてください。
ここで、ACGT文字列とはA,C,G,T以外の文字を含まない文字列です。

## 注記文字列 T の部分文字列とは、T の先頭と末尾から 0 文字以上を取り去って得られる文字列です。
例えば、ATCODER の部分文字列には TCO, AT, CODER, ATCODER,  (空文字列) が含まれ、AC は含まれません。

## 制約
S は長さ 1 以上 10 以下の文字列である。
S の各文字は英大文字である。

## 入力入力は以下の形式で標準入力から与えられる。
S

## 出力S の部分文字列であるような最も長い ACGT 文字列の長さを出力せよ。

## 入力例 1
ATCODER

## 出力例 1
3

ATCODER の部分文字列であるような ACGT 文字列のうち、最も長いものは ATC です。

## 入力例 2
HATAGAYA

## 出力例 2
5

HATAGAYA の部分文字列であるような ACGT 文字列のうち、最も長いものは ATAGA です。

## 入力例 3
SHINJUKU

## 出力例 3
0

SHINJUKU の部分文字列であるような ACGT 文字列のうち、最も長いものは
(空文字列) です。
=end

require 'prime'

s = gets.chomp

s = s.gsub(/[^ACGT]/, ' ')

puts s.split.map(&:length).max || 0
