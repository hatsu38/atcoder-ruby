=begin
1 から
N までの番号が付けられた
N 人の人がいます。 それぞれの人にはプログラミング力という整数値が定まっており、人
i のプログラミング力は
P
i
​
  です。 人
1 が最強になるためには、あといくつプログラミング力を上げる必要がありますか？ すなわち、すべての
i

=1 に対して
P
1
​
 +x>P
i
​
  を満たすような最小の非負整数
x は何ですか？

# input
4
5 15 2 10

# output
11

=end

require 'prime'

N = gets.chomp.to_i
P_ARY = gets.chomp.split.map(&:to_i)

if N == 1
  puts 0
  exit
end

p1 = P_ARY[0]
other_p_ary = P_ARY[1..]

puts other_p_ary.max >= p1 ? other_p_ary.max + 1 - p1 : 0
