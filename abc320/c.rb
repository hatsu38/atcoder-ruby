=begin
## 問題文
この問題はG問題の簡易版です。
3個のリールからなるスロットがあります。
i番目のリールの配列は文字列Si​によって表されます。
ここで、Si​は数字のみからなる長さMの文字列です。
それぞれのリールには対応するボタンがついています。
高橋君は各非負整数tについて、スロットが回り始めてからちょうどt秒後にボタンを1つ選んで押す、または何もしないことができます。
スロットが回り始めてからt秒後にi番目のリールに対応するボタンを押すと、i番目のリールはSi​の(tmodM)+1文字目を表示して止まります。
ただし、tmodMでtをMで割ったあまりを表します。
高橋君は全てのリールを止めた上で、表示されている文字が全て同じであるようにしたいです。
高橋君が目標を達成できるように全てのリールを止めるまでに、スロットが回り始めてから最小で何秒かかるかを求めてください。
そのようなことが不可能であればそのことを報告してください。

## 制約
1≤M≤100
M は整数
Si​ は数字のみからなる長さ M の文字列

## 入力入力は以下の形式で標準入力から与えられる。
M
S1​
S2​
S3​

## 出力全てのリールを止めた上で、表示されている文字が全て同じであるようにすることができないなら -1 を出力せよ。
できるなら、スロットが回り始めてからそのような状態にするまでに最小で何秒かかるか出力せよ。

## 入力例 1
10
1937458062
8124690357
2385760149

## 出力例 1
6

高橋君は次のようにそれぞれのリールを止めることでスロットが回り始めてから 6 秒後にリールに表示される文字を 8 で揃えることができます。
スロットの回転開始から 0 秒後に 2 番目のリールに対応するボタンを押します。2 番目のリールは S2​ の (0mod10)+1=1 文字目である 8 を表示して止まります。
スロットの回転開始から 2 秒後に 3 番目のリールに対応するボタンを押します。3 番目のリールは S3​ の (2mod10)+1=3 文字目である 8 を表示して止まります。
スロットの回転開始から 6 秒後に 1 番目のリールに対応するボタンを押します。1 番目のリールは S1​ の (6mod10)+1=7 文字目である 8 を表示して止まります。
5 秒以下で全てのリールに表示されている文字を揃える方法はないため、6 を出力します。

## 入力例 2
20
01234567890123456789
01234567890123456789
01234567890123456789

## 出力例 2
20

全てのリールを止めた上で、表示されている文字を揃える必要がある事に注意してください。

## 入力例 3
5
11111
22222
33333

## 出力例 3
-1

表示されている文字が全て同じであるようにリールを止めることはできません。
このとき -1 を出力してください。

=end

require 'prime'

m = gets.to_i
s1 = gets.chomp
s2 = gets.chomp
s3 = gets.chomp

ans = Float::INFINITY

(0..m).each do |i|
  (0..m * 2).each do |j|
    (0..m * 3).each do |k|
      next if i == j || j == k || k == i

      i_mod = i % m
      j_mod = j % m
      k_mod = k % m
      s1_str = s1[i_mod]
      s2_str = s2[j_mod]
      s3_str = s3[k_mod]
      next if s1_str.nil? || s2_str.nil? || s3_str.nil?

      if s1_str == s2_str && s2_str == s3_str
        time = [i, j, k].max
        ans = [ans, time].min
      end
    end
  end
end

puts ans == Float::INFINITY ? -1 : ans
