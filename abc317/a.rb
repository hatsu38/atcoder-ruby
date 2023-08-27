=begin

ナオヒロ君はモンスターを飼っています。モンスターの現在の体力は
H です。
また、ナオヒロ君は
N 種類の傷薬を持っています。傷薬は効き目の弱い順に
1 から
N までの番号がついています。
傷薬
n をモンスターに与えると、モンスターの体力が
P
n
​
  増加します。ここで、
P
1
​
 <P
2
​
 <⋯<P
N
​
  が成り立ちます。

ナオヒロ君は傷薬を
1 つモンスターに与えることで、モンスターの体力を
X 以上にしたいです。
目標を達成できる傷薬のうち最も効き目の弱いものの番号を出力してください。(制約下においてそのような傷薬が存在することが保証されています。)

# input
3 100 200
50 200 999

# output
2

=end

require 'prime'

N, H, X = gets.chomp.split.map(&:to_i)

P = gets.chomp.split.map(&:to_i).sort

tmp = X - H

if tmp <= 0
  puts 0
  exit
end

P.each_with_index do |p, i|
  if tmp <= p
    puts i + 1
    exit
  end
end
