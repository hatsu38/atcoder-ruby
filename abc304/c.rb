=begin
1,2,…,N の番号がついた
N 人の人が二次元平面上におり、人
i は座標 (X i,Y i) で表される地点にいます。

人 1 がウイルスに感染しました。ウイルスに感染した人から距離が
D 以内にいる人にウイルスはうつります。
ただし、距離はユークリッド距離、すなわち
2 点
(a 1,a 2) と
(b 1,b 2) に対し、この
2 点間の距離が
((a1 −  b1) ** 2 +(a2 − b2) ** 2) ** (1 / 2)
であるものとして定められています。

十分に時間が経過した、すなわち人
i がウイルスに感染しているならば 人
i との距離が D 以内にいるすべての人がウイルスに感染している状態になったときに、各
i について人 i がウイルスに感染しているか判定してください。

# input
9 4
3 2
6 -1
1 6
6 5
-2 -3
5 3
2 -3
2 1
2 6

# output
Yes
No
No
Yes
Yes
Yes
Yes
Yes
No
=end

N, D = gets.split.map(&:to_i)

x_ary = []
N.times do
  x_ary << gets.split.map(&:to_i)
end

def distance(a, b)
  Math.sqrt(((a[0] - b[0])**2) + ((a[1] - b[1])**2))
end

# 最初の一人を登録する
answer_hash = { 0 => true }

# 各点が他の点の感染範囲内にあるかどうかを保存する配列
can_infect_ary = Hash.new { |hash, key| hash[key] = [] }

N.times do |i|
  N.times do |j|
    next if i == j

    can_infect_ary[i] << j if distance(x_ary[i], x_ary[j]) <= D
  end
end

is_infected = true
# 感染者が発生しなくなるまでループする
while is_infected
  is_infected = false
  N.times do |i|
    next if answer_hash[i]

    can_infect_ary[i].each do |j|
      next unless answer_hash[j]

      answer_hash[i] = true
      is_infected = true
    end
  end
end

N.times do |i|
  puts answer_hash[i] ? 'Yes' : 'No'
end
