=begin
8 個の整数
S
1
​
 ,S
2
​
 ,…,S
8
​
  が与えられます。 以下の
3 つの条件が全て満たされるならば Yes を、そうでないならば No を出力してください。

数列
(S
1
​
 ,S
2
​
 ,…,S
8
​
 ) は広義単調増加である。すなわち、
S
1
​
 ≤S
2
​
 ≤⋯≤S
8
​
  である。
S
1
​
 ,S
2
​
 ,…,S
8
​
  は全て
100 以上
675 以下である。
S
1
​
 ,S
2
​
 ,…,S
8
​
  は全て
25 の倍数である。
# input
125 175 250 300 400 525 600 650

# output
Yes

=end

require 'prime'

ary = gets.chomp.split.map(&:to_i)
correct_size = ary.filter { |n| n >= 100 && n <= 675 }.count { |n| (n % 25).zero? }

if correct_size == 8 && ary == ary.sort
  puts 'Yes'
else
  puts 'No'
end
