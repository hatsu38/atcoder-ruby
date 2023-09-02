=begin
## 問題文
H行W列のマス目で表されるキャンバスがあります.上からi番目,左からj番目のマスを(i,j)と表します.最初,すべてのマス目は白色です.square1001君は,黒い絵の具を使って絵を描きたいと思いました.具体的には,square1001君の目標は,si,j​=#のときマス(i,j)を黒色,si,j​=.のときマス(i,j)を白色にすることです.しかし,彼は絵を描くことが得意ではないので,何回か(0回でもよい)「上下左右に隣接する2つのマスを選び,両方黒く塗る」ことしかできません.ただし,すでに黒く塗られているマスを選ぶこともでき,この場合マスの色は黒のまま変わりません.square1001君が目標を達成することができるか判定してください.

## 制約

H は 1 以上 50 以下の整数
W は 1 以上 50 以下の整数
すべての (i,j) (1≤i≤H,1≤j≤W) に対して, si,j​ は # または .

## 入力
入力は以下の形式で標準入力から与えられる.

H W
s1,1​s1,2​s1,3​...s1,W​
s2,1​s2,2​s2,3​...s2,W​

:
 :
sH,1​sH,2​sH,3​...sH,W​

## 出力
square1001 君が目標を達成することができるならば Yes、達成できないならば No と出力しなさい.

## 入力例 1
3 3
.#.
###
.#.

## 出力例 1
Yes

目標を達成する手順の一例として, 下の図の方法が挙げられます. この図では, 「次に黒く塗るマス」を「☆」で表しています.

## 入力例 2
5 5
#.#.#
.#.#.
#.#.#
.#.#.
#.#.#

## 出力例 2
No

square1001 君は目標を達成することができません.

## 入力例 3
11 11
...#####...
.##.....##.
#..##.##..#
#..##.##..#
#.........#
#...###...#
.#########.
.#.#.#.#.#.
##.#.#.#.##
..##.#.##..
.##..#..##.

## 出力例 3
Yes

=end

require 'prime'

@h, @w = gets.split.map(&:to_i)

@h_ary = []

@h.times do
  @h_ary << gets.chomp.chars
end

def i_j_judge(i, j)
  if i.zero?
    if j.zero?
      @h_ary[i][j + 1] == '#' || @h_ary[i + 1][j] == '#'
    elsif j == @w - 1
      @h_ary[i][j - 1] == '#' || @h_ary[i + 1][j] == '#'
    else
      @h_ary[i][j - 1] == '#' || @h_ary[i][j + 1] == '#' || @h_ary[i + 1][j] == '#'
    end
  elsif i == @h - 1
    if j.zero?
      @h_ary[i][j + 1] == '#' || @h_ary[i - 1][j] == '#'
    elsif j == @w - 1
      @h_ary[i][j - 1] == '#' || @h_ary[i - 1][j] == '#'
    else
      @h_ary[i][j - 1] == '#' || @h_ary[i][j + 1] == '#' || @h_ary[i - 1][j] == '#'
    end
  elsif j.zero?
    @h_ary[i][j + 1] == '#' || @h_ary[i - 1][j] == '#' || @h_ary[i + 1][j] == '#'
  elsif j == @w - 1
    @h_ary[i][j - 1] == '#' || @h_ary[i - 1][j] == '#' || @h_ary[i + 1][j] == '#'
  else
    @h_ary[i][j - 1] == '#' || @h_ary[i][j + 1] == '#' || @h_ary[i - 1][j] == '#' || @h_ary[i + 1][j] == '#'
  end
end

@h_ary.each_with_index do |tmp_h, i|
  tmp_h.each_with_index do |tmp_w, j|
    if tmp_w == '#' && !i_j_judge(i, j)
      puts 'No'
      exit
    end
  end
end

puts 'Yes'