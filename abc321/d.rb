=begin
## 問題文
AtCoder食堂ではN種類の主菜とM種類の副菜が提供されており、i種類目の主菜の価格はAi​、j種類目の副菜の価格はBj​です。
AtCoder食堂では新たに定食のメニューを設けることを検討しています。
定食は1種類の主菜と1種類の副菜から構成され、主菜と副菜の価格の和をsとしたとき、定食の価格はmin(s,P)です。
ここで、Pは入力で与えられる定数です。
定食を構成する主菜と副菜の選び方はNM通りありますが、それらすべてに対する定食の価格の総和を求めてください。

## 制約
1≤N,M≤2×10**5
1≤Ai​,Bj​≤10**8
1≤P≤2×10**8
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N M P
A1​ A2​ … AN​
B1​ B2​ … BM​

## 出力答えを整数として出力せよ。
なお、本問題の制約下では、答えは 64 bit 符号付き整数型の範囲に収まることが証明できる。

## 入力例 1
2 2 7
3 5
6 1

## 出力例 1
24

1 種類目の主菜と 1 種類目の副菜を選んだ場合、定食の価格は min(3+6,7)=7 です。
1 種類目の主菜と 2 種類目の副菜を選んだ場合、定食の価格は min(3+1,7)=4 です。
2 種類目の主菜と 1 種類目の副菜を選んだ場合、定食の価格は min(5+6,7)=7 です。
2 種類目の主菜と 2 種類目の副菜を選んだ場合、定食の価格は min(5+1,7)=6 です。
よって、答えは 7+4+7+6=24 です。

## 入力例 2
1 3 2
1
1 1 1

## 出力例 2
6

## 入力例 3
7 12 25514963
2436426 24979445 61648772 23690081 33933447 76190629 62703497
11047202 71407775 28894325 31963982 22804784 50968417 30302156 82631932 61735902 80895728 23078537 7723857

## 出力例 3
2115597124

=end

require 'prime'

N, M, P = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i).sort

cumulative_sum = Array.new(M + 1, 0)

B.each_with_index do |b, index|
  cumulative_sum[index + 1] = cumulative_sum[index] + b
end

ans = 0

A.each do |a|
  if a + B[0] > P
    ans += P * M
  else
    low = 0
    high = M
    while low < high
      mid = (low + high) / 2
      if a + B[mid] > P
        high = mid
      else
        low = mid + 1
      end
    end
    ans += (P * (M - low)) + (cumulative_sum[low] + (a * low))
  end
end

puts ans