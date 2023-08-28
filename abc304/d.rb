=begin
xy -平面上にいくつかのイチゴが載った長方形のケーキがあります。 ケーキは、長方形領域
{(x,y):0≤x≤W,0≤y≤H} をちょうど占めます。

ケーキには
N 個のイチゴが載っており、
i=1,2,…,N について、
i 番目のイチゴの座標は
(p
i
​
 ,q
i
​
 ) です。
2 個以上のイチゴが同一の座標にあることはありません。

高橋君は、このケーキを包丁で下記の通りにいくつかのピースに切り分けます。

まず、ケーキを通る
y 軸に並行な
A 本の異なる直線、直線
x=a
1
​
  、直線
x=a
2
​
  、
… 、直線
x=a
A
​
  のそれぞれにそってケーキを切る。
次に、ケーキを通る
x 軸に並行な
B 本の異なる直線、直線
y=b
1
​
  、直線
y=b
2
​
  、
… 、直線
y=b
B
​
  のそれぞれにそってケーキを切る。
その結果、ケーキは
(A+1)(B+1) 個の長方形のピースに分割されます。 高橋君はそれらのうちのいずれか
1 個だけを選んで食べます。 高橋君が選んだピースに載っているイチゴの個数としてあり得る最小値と最大値をそれぞれ出力してください。

ここで、最終的にピースの縁となる位置にはイチゴが存在しないことが保証されます。 より形式的な説明は下記の制約を参照してください。

# 入力例
7 6
5
6 1
3 1
4 2
1 5
6 2
2
2 5
2
3 4
# 出力例
0 2

=end

require 'prime'
X, Y, Z = gets.chomp.split.map(&:to_i)
S = gets.chomp.chars

dp = Array.new((S.size + 1)) { Array.new(2, Float::INFINITY) }
dp[0] = [0, Z]

S.size.times.each do |i|
  if S[i] == 'a'
    dp[i + 1][0] = [dp[i][0] + X, dp[i][1] + Z + X].min
    dp[i + 1][1] = [dp[i][0] + Z + Y, dp[i][1] + Y].min
  else
    dp[i + 1][0] = [dp[i][0] + Y, dp[i][1] + Z + Y].min
    dp[i + 1][1] = [dp[i][0] + Z + X, dp[i][1] + X].min
  end
end
puts dp[S.size].min
