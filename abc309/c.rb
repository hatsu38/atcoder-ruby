=begin
高橋君は医者のすぬけ君から N 種類の薬を処方されました。
i 種類目の薬は(処方された日を含めて) a i日間、毎日 b i錠ずつ飲む必要があります。
また、高橋君はこれ以外の薬を飲む必要がありません。

薬を処方された日を 1 日目とします。
1 日目以降で、初めて高橋君がその日に飲む必要がある薬が
K 錠以下になるのは何日目かを求めてください。

制約
1≤N≤3×10 ** 5
0≤K≤10 ** 9
1≤a i,b i≤10 ** 9
入力はすべて整数

# input
4 8
6 3
2 5
1 9
4 2

# output
3

# input
4 100
6 3
2 5
1 9
4 2

# output
1

# input
15 158260522
877914575 2436426
24979445 61648772
623690081 33933447
476190629 62703497
211047202 71407775
628894325 31963982
822804784 50968417
430302156 82631932
161735902 80895728
923078537 7723857
189330739 10286918
802329211 4539679
303238506 17063340
492686568 73361868
125660016 50287940

# output
492686569

=end

require 'prime'

N, K = gets.chomp.split.map(&:to_i)

a_b_hash = {}
N.times do |_i|
  a, b = gets.chomp.split.map(&:to_i)
  a_b_hash[a] = a_b_hash[a] ? a_b_hash[a] += b : b
end

sum = a_b_hash.values.sum
if sum <= K
  puts 1
  exit
end

days = a_b_hash.keys.sort
day = days.first

days.each do |d|
  day = d + 1

  sum -= a_b_hash[d]
  break if sum <= K
end

puts day
