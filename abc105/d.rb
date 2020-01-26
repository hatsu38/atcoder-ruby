### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5 2
# 1 4
# 2 5
# output
# 10

N,M = gets.chomp.split(" ").map(&:to_i)
strs = M.times.map{gets.split.map(&:to_i)}

strs.sort_by! { |a, b| b }

expect_bridge = 0
ans = 0
strs.each do |a, b|
  next if a <= expect_bridge
  ans += 1
  expect_bridge = b - 1
end
puts ans
