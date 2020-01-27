### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 10 100000
# 3
# 31
# 314
# 3141
# 31415
# 314159
# 400000
# 410000
# 500000
# 777777
# output
# 517253

n, t = gets.chomp.split(' ').map(&:to_i)
strs = n.times.map{ gets.to_i }
diff_ary = []
strs.each_with_index do |num, i|
  break if i == n-1
  diff_ary << strs[i+1]-num
end
puts diff_ary.select{|num| num>=t }.size * t + diff_ary.select{|num| num<t }.inject(:+) + t
