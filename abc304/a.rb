=begin
人
1 、人
2 、
… 、人
N と番号付けられた
N 人が、この順番で時計回りに円卓に座っています。 特に、時計回りで人
N の次の位置には人
1 が座っています。

i=1,2,…,N について、人
i の名前は
S
i
​
  、年齢は
A
i
​
  です。 ここで、異なる
2 人が同じ名前や同じ年齢であることはありません。

年齢が最も小さい人を起点として、座っている位置の時計回りの順番で、
N 人全員の名前を出力してください。

# input
5
alice 31
bob 41
carol 5
dave 92
ellen 65

# output
carol
dave
ellen
alice
bob

=end

require 'prime'

n = gets.chomp.to_i

a_ary = []

n.times do
  a_ary << gets.chomp.split
end

min_index = a_ary.index(a_ary.min_by { |a| a[1].to_i })

a_ary.rotate!(min_index)

a_ary.each do |a|
  puts a[0]
end
