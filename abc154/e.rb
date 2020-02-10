### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 314159
# 2
# output
# 117879300

n = gets.to_i
k = gets.to_i

# 0でない数がちょうどk個あるようなものの個数

# 0でないk個あるようなものの個数
ans = 0
[*1..n].each do |num|
  ans += 1 if num.to_s.split('').map(&:to_i).count { |i| i != 0 } == k
end
puts ans
# puts n.to_s.size

