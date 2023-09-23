=begin
## 問題文
以下の条件を満たす正整数xを321-likeNumberと呼びます。
この定義はA問題と同様です。
xの各桁を上から見ると狭義単調減少になっている。
すなわち、xがd桁の整数だとすると、1≤i<dを満たす全ての整数iについて以下の条件を満たす。
(xの上からi桁目)>(xの上からi+1桁目)
なお、1桁の正整数は必ず321-likeNumberであることに注意してください。
例えば、321,96410,1は321-likeNumberですが、123,2109,86411は321-likeNumberではありません。
K番目に小さい321-likeNumberを求めてください。

## 制約
入力は全て整数
1≤K
321-like Number は K 個以上存在する

## 入力入力は以下の形式で標準入力から与えられる。
K

## 出力K 番目に小さい 321-like Number を整数として出力せよ。

## 入力例 1
15

## 出力例 1
32

321-like Number は小さいものから順に (1,2,3,4,5,6,7,8,9,10,20,21,30,31,32,40,…) です。
このうち 15 番目に小さいものは 32 です。

## 入力例 2
321

## 出力例 2
9610

## 入力例 3
777

## 出力例 3
983210

=end

require 'prime'

k = gets.to_i

queue = (1..9).to_a

(k - 1).times do
  num = queue.shift
  last_digit = num % 10

  (0...last_digit).each do |i|
    queue << ((num * 10) + i)
  end
end

puts queue.first
