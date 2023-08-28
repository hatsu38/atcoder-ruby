=begin
高橋君は黒いマスと透明なマスからなるシート A,B を 1 枚ずつと、
透明なマスのみからなる無限に広がるシート C を持っています。
また、高橋君には黒いマスと透明なマスからなる、理想とするシート X が存在します。
シート A,B,X の大きさはそれぞれ
縦 H Aマス × 横 W Aマス
縦 H Bマス × 横 W Bマス
縦 H Xマス × 横 W Xマスです。
シート A の各マスは . と # からなる長さ W Aの文字列 H A個
A 1,A 2,…,A H A​ によって表され、
A i(1≤i≤H A) の j 文字目 (1≤j≤W A) が、 . のときシート
A の上から i 行目かつ左から
j 列目のマスは透明なマスであり、
# のとき黒いマスです。

シート B,X の各マスも、同様に長さ W Bの文字列
H B個 B 1,B 2,…,B H B​ および長さ W Xの文字列 H X個
X 1,X 2,…,X H X​ によって表されます。

高橋君の目標は、次の手順で、シート
A,B,C から、A,B に存在する すべての黒いマスを使って シート X を作り出すことです。

シート
A,B をマス目に沿ってシート
C に貼り付ける。この時、シート
A,B はそれぞれ好きな場所に平行移動させて貼って良いが、シートを切り分けたり、回転させたりしてはいけない。
シート C からマス目に沿って H X×W Xマスの領域を切り出す。

ここで、切り出されたシートの各マスは、シート A または
B の黒いマスが貼り付けられていれば黒いマスに、そうでなければ透明なマスとなる。

このとき、貼り付ける位置と切り出す領域をうまくとることで高橋君は目標を達成できるか
すなわち次の条件をともにみたすことにできるか判定してください。

切り出されたシートはシート A,B の 黒いマスをすべて 含む。
切り出されたシートの上でシート A,B の黒いマスどうしが重なって存在していても構わない。
切り出されたシートは、回転させたり裏返したりすることなくシート X と一致する。

H, W, H1, W1, H2, W2はそれぞれ1以上10以下の整数

# 入力例
3 5
#.#..
.....
.#...
2 2
#.
.#
5 3
...
#.#
.#.
.#.
...
# 出力例
Yes

入力例
2 2
#.
.#
2 2
#.
.#
2 2
##
##

出力例
No

入力例
1 1
#
1 2
##
1 1
#

出力例
No

入力例
3 3
###
...
...
3 3
#..
#..
#..
3 3
..#
..#
###

出力例
Yes

=end

require 'prime'

H, W = gets.chomp.split.map(&:to_i)
A_ARY = []
H.times do
  A_ARY << gets.chomp
end

H2, W2 = gets.chomp.split.map(&:to_i)
B_ARY = []
H2.times do
  B_ARY << gets.chomp
end

H3, W3 = gets.chomp.split.map(&:to_i)
C_ARY = []
H3.times do
  C_ARY << gets.chomp
end

shrink = lambda { |h, w, a|
  top = nil
  bottom = nil
  left = w
  right = 0
  0.upto(h - 1) do |i|
    next unless (l = a[i].index('#'))

    top ||= i
    bottom = i
    left = [left, l].min
    right = [right, a[i].rindex('#')].max
  end
  h = bottom - top + 1
  w = right - left + 1
  a = a.drop(top).take(h).map { _1[left, w] }
  [h, w, a]
}

H_A, W_A, A = shrink[H, W, A_ARY]
H_B, W_B, B = shrink[H2, W2, B_ARY]

if H_A > H3 || H_B > H3 || W_A > W3 || W_B > W3
  puts 'No'
  exit
end

test = lambda { |xi, xj, xt, h, w, ab|
  xt = xt.map(&:dup)
  h.times do |i|
    w.times do |j|
      next unless ab[i][j] == '#'
      return nil if xt[xi + i][xj + j] == '.'

      xt[xi + i][xj + j] = '@'
    end
  end
  xt
}

0.upto(H3 - H_A) do |xi|
  0.upto(W3 - W_A) do |xj|
    xt1 = test[xi, xj, C_ARY, H_A, W_A, A] or next
    0.upto(H3 - H_B) do |xbi|
      0.upto(W3 - W_B) do |xbj|
        xt2 = test[xbi, xbj, xt1, H_B, W_B, B] or next
        if xt2.all? { _1.index('#').nil? }
          puts 'Yes'
          exit
        end
      end
    end
  end
end

puts 'No'
