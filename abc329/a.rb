=begin
## 問題文
英大文字からなる文字列Sが与えられます。
Sの各文字を空白で区切り、その順で1文字ずつ出力してください。

## 制約
S は長さ 2 以上 100 以下の英大文字からなる文字列

## 入力入力は以下の形式で標準入力から与えられる。
S

## 出力S の各文字を空白で区切り、1 文字ずつ出力せよ。

## 入力例 1
ABC

## 出力例 1
A B C

A, B, C を空白で区切り、1 文字ずつ出力してください。
C の後ろに空白を出力する必要がないことに注意してください。

## 入力例 2
ZZZZZZZ

## 出力例 2
Z Z Z Z Z Z Z

## 入力例 3
OOXXOO

## 出力例 3
O O X X O O

=end

require 'prime'

s = gets.chomp

puts s.chars.join(' ')
