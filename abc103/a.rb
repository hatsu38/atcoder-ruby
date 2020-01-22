### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 1 6 3
# output
# 5
strs = gets.chomp.split(" ").map(&:to_i).sort

ans = 0
strs.each_with_index do |num, idx|
  break if idx == strs.length - 1
  ans += strs[idx+1] - num
end
puts ans
