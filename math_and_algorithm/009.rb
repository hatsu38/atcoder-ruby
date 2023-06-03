=begin
N 枚のカードが横一列に並べられています。左から
i 番目
(1≤i≤N) のカードには整数
A
i
​
  が書かれています。

カードの中からいくつかを選んで、合計がちょうど
S となるようにする方法はありますか。

input
3 11
2 5 9
output
Yes
=end

n, s = gets.chomp.split.map(&:to_i)

puts (1..n).to_a.repeated_permutation(2).filter { |a, b| a + b <= s }.size
