=begin
## 問題文
英小文字からなる文字列S,Tが与えられます。
Sの長さはN、Tの長さはMです。
(N≤Mが制約で保証されています)SがTの接頭辞であるとは、TのはじめN文字からなる文字列がSと一致することを言います。
SがTの接尾辞であるとは、Tの後ろN文字からなる文字列がSと一致することを言います。
SがTの接頭辞であり、かつ接尾辞でもある場合は0を、SがTの接頭辞であるが、接尾辞でない場合は1を、SがTの接尾辞であるが、接頭辞でない場合は2を、SがTの接頭辞でも接尾辞でもない場合は3を出力してください。

## 制約
1≤N≤M≤100
S は英小文字からなる長さ N の文字列
T は英小文字からなる長さ M の文字列

## 入力入力は以下の形式で標準入力から与えられる。
N M
S
T

## 出力問題文の指示に従って答えを出力せよ。

## 入力例 1
3 7
abc
abcdefg

## 出力例 1
1

S は T の接頭辞ですが接尾辞ではありません。よって 1 を出力します。

## 入力例 2
3 4
abc
aabc

## 出力例 2
2

S は T の接尾辞ですが接頭辞ではありません。

## 入力例 3
3 3
abc
xyz

## 出力例 3
3

S は T の接頭辞でも接尾辞でもありません。

## 入力例 4
3 3
aaa
aaa

## 出力例 4
0

S と T が完全に一致する場合もあります。この場合、S は T の接頭辞であり、かつ接尾辞でもあります。

=end

require 'prime'

n, = gets.split.map(&:to_i)
s = gets.chomp
t = gets.chomp

st_settoji = t[0...n] == s
st_settobi = t[-n..] == s

if st_settoji && st_settobi
  puts 0
elsif st_settoji
  puts 1
elsif st_settobi
  puts 2
else
  puts 3
end
