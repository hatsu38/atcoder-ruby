=begin
## 問題文
文字列Sが与えられます。
Sの連続する部分文字列のうち、回文であるものの長さの最大値を求めてください。
ただし、Sの連続する部分文字列であって回文であるものは常に存在します。

## 制約
S は長さ 2 以上 100 以下の英大文字からなる文字列

## 入力入力は以下の形式で標準入力から与えられる。
S

## 出力答えを出力せよ。

## 入力例 1
TOYOTA

## 出力例 1
5

TOYOTA の連続する部分文字列 TOYOT は長さ 5 の回文です。
TOYOTA の唯一の長さ 6 の連続する部分文字列 TOYOTA は回文でないので、5 を出力します。

## 入力例 2
ABCDEFG

## 出力例 2
1

すべての長さ 1 の連続する部分文字列は回文です。

## 入力例 3
AAAAAAAAAA

## 出力例 3
10

=end

require 'prime'

s = gets.chomp

max = 0

(0..s.length - 1).each do |i|
  (i..s.length - 1).each do |j|
    max = [max, j - i + 1].max if s[i..j] == s[i..j].reverse
  end
end

puts max
