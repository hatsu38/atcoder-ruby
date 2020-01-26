### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3
# 3 4 6
# output
# 10

N = gets.chomp.split(" ").map(&:to_i)
strs = gets.chomp.split(" ").map(&:to_i)

sum = 0
strs.each do |num|
  sum += num-1
end
puts sum
