=begin
## 問題文
AtCoderでは、レーティング上位10人のハンドルネームには金色の冠が、上位1人のハンドルネームには白金色の冠が表示されます。
このコンテストが開始した時点で、アルゴリズム部門での上位10人に入っているプレイヤーのハンドルネームとレーティングは以下のようになっています。
Copytourist3858ksun483679Benq3658Um_nik3648apiad3638Stonefeang3630ecnerwala3613mnbvmar3555newbiedmy3516semiexp3481tourist3858ksun483679Benq3658Um_nik3648apiad3638Stonefeang3630ecnerwala3613mnbvmar3555newbiedmy3516semiexp3481上記のプレイヤーのハンドルネームSが与えられるので、その人のレーティングを出力してください。

## 制約
S はアルゴリズム部門でレーティング上位 10 人に入っているプレイヤーのハンドルネームのいずれかと等しい。

## 入力入力は以下の形式で標準入力から与えられる。
S

## 出力対応するプレイヤーのレーティングを 1 行で出力せよ。

## 入力例 1
tourist

## 出力例 1
3858

このコンテストが開始した時点において、 tourist さんのアルゴリズム部門のレーティングは 3858 です。

## 入力例 2
semiexp

## 出力例 2
3481

このコンテストが開始した時点において、 semiexp さんのアルゴリズム部門のレーティングは 3481 です。

=end

require 'prime'

list_hash = {
  'tourist' => 3858,
  'ksun48' => 3679,
  'Benq' => 3658,
  'Um_nik' => 3648,
  'apiad' => 3638,
  'Stonefeang' => 3630,
  'ecnerwala' => 3613,
  'mnbvmar' => 3555,
  'newbiedmy' => 3516,
  'semiexp' => 3481
}

s = gets.chomp

puts list_hash[s]
