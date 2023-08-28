=begin
N 行 N 列のマス目が与えられます。
上から i 行目、左から j 列目のマスには整数 A i,jが書かれています。
ここで、A i,jは 0 か 1 であることが保証されます。

マス目の外側のマスに書かれた整数を時計回りに
1 個ずつずらしたときのマス目を出力してください。

ただし外側のマスとは、
1 行目、
N 行目、
1 列目、
N 列目のいずれか
1 つ以上に属するマスの集合のことを指します。

# 入力例
4
0101
1101
1111
0000

# 出力例
1010
1101
0111
0001

# 入力例
2
11
11

# 出力例
11
11

# 入力例
5
01010
01001
10110
00110
01010

# 出力例
00101
11000
00111
00110
10100

=end

require 'prime'
N = gets.chomp.to_i
A_ARY = []

N.times do |i|
  A_ARY[i] = gets.chomp.chars.map(&:to_i)
end

correct_ary = []

A_ARY.each_with_index do |ary, i|
  correct_ary << []
  ary.each_with_index do |_a, j|
    correct_ary[i][j] = if i.zero?
                          if j.zero?
                            A_ARY[i + 1][j]
                          else
                            A_ARY[i][j - 1]
                          end
                        elsif i == N - 1 # 最終行
                          if j == N - 1
                            A_ARY[i - 1][j]
                          else
                            A_ARY[i][j + 1]
                          end
                        elsif j.zero? # 2行目以降 && 最終行以前
                          A_ARY[i + 1][j]
                        elsif j == N - 1
                          A_ARY[i - 1][j]
                        else
                          A_ARY[i][j]
                        end
  end
end

correct_ary.each do |ary|
  puts ary.join
end
