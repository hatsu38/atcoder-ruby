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

入力例
3 11
2 5 9
出力例
Yes
=end

n, s = gets.chomp.split.map(&:to_i)
a_ary = gets.chomp.split.map(&:to_i)

dp = Array.new(n + 1) { Array.new(s + 1, false) }
dp[0][0] = true

n.times do |i|
  (s + 1).times do |j|
    if dp[i][j]
      dp[i + 1][j] = true
      dp[i + 1][j + a_ary[i]] = true
    end
  end
end

puts dp[n][s] ? 'Yes' : 'No'
