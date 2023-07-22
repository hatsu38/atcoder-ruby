=begin
A, B, C からなる文字列
S が与えられます。
S は A, B, C を全て含むことが保証されます。

S を左から 1 文字ずつ見ていったときに、はじめて次の条件を満たした状態になるのは、
左から何文字目まで見たときですか？

A, B, C が全て 1 回以上出現している。

# input
5
ACABB

# output
4

=end

require 'prime'

N = gets.chomp.to_i
S = gets.chomp.chars

correct = {
  A: false,
  B: false,
  C: false
}

S.each_with_index do |s, i|
  correct[s] =
    true
  if correct['A'] && correct['B'] && correct['C']
    puts i + 1
    break
  end
end
