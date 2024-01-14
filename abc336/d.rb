=begin
## 問題文
正の整数kについて、サイズkのピラミッド数列とは、長さ(2k−1)の数列であって各項の値が順に1,2,…,k−1,k,k−1,…,2,1であるようなものをさします。
長さNの数列A=(A1​,A2​,…,AN​)が与えられます。
Aに対して、次の操作のうち一方を選んで行うことを繰り返して(0回でも良い)得ることのできるピラミッド数列のサイズの最大値を求めてください。
数列の項を1つ選び、その項の値を1減少させる。
先頭または末尾の項を削除する。
なお、問題の制約のもとで、操作を繰り返すことで必ず1種類以上のピラミッド数列を得ることができることが証明できます。

## 制約
1≤N≤2×10**5
1≤Ai​≤10**9
入力はすべて整数

## 入力入力は以下の形式で標準入力から与えられる。
N
A1​ A2​ … AN​

## 出力数列 A に問題文の操作を繰り返して得ることのできるピラミッド数列のサイズの最大値を出力せよ。

## 入力例 1
5
2 2 3 1 1

## 出力例 1
2

A=(2,2,3,1,1) から始めて、
次のようにして数列 A からサイズ 2 のピラミッド数列を作る事ができます。
第 3 項を選び、1 減少させる。数列は A=(2,2,2,1,1) となる。
先頭を削除する。数列は A=(2,2,1,1) となる。
末尾を削除する。数列は A=(2,2,1) となる。
第 1 項を選び、1 減少させる。数列は A=(1,2,1) となる。
(1,2,1) はサイズ 2 のピラミッド数列です。
一方、どのように操作を行ってもサイズ 3 以上のピラミッド数列を作ることはできないため 2 を出力します。

## 入力例 2
5
1 2 3 4 5

## 出力例 2
3

## 入力例 3
1
1000000000

## 出力例 3
1

=end

require 'prime'

N = gets.to_i
A = gets.split.map(&:to_i)

def max_pyramid_size(arr, n)
  return 1 if n == 1

  # 左右からの最大拡張サイズを記録する配列
  left = Array.new(n, 1)
  right = Array.new(n, 1)

  # 左からの最大拡張サイズを計算
  (1...n).each do |i|
    left[i] = [left[i - 1] + 1, arr[i]].min
  end

  # 右からの最大拡張サイズを計算
  (n - 2).downto(0).each do |i|
    right[i] = [right[i + 1] + 1, arr[i]].min
  end

  # 両側からの拡張サイズの小さい方を取り、最大のサイズを見つける
  max_size = 0
  (0...n).each do |i|
    # clampを使って書き直す
    max_size = [max_size, [left[i], right[i]].min].max
  end

  max_size
end

puts max_pyramid_size(A, N)

# def max_pyramid_size(arr, n)
#   return 1 if n == 1

#   left = Array.new(n, 1)
#   right = Array.new(n, 1)
#   max_size = 0

#   (1...n).each do |i|
#     left[i] = [left[i - 1] + 1, arr[i]].min
#     right_index = n - i - 1
#     right[right_index] = [right[right_index + 1] + 1, arr[right_index]].min
#     current_max = [left[i], right[right_index]].min
#     max_size = current_max.clamp(max_size, n)
#   end

#   max_size
# end

# N = gets.to_i
# A = gets.split.map(&:to_i)

# puts max_pyramid_size(A, N)
