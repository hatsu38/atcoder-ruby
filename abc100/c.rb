### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 3
# 5 2 4
# N = 3
# strs = [5,2,4]
# output
# 3

N = gets.chomp.split(" ").map(&:to_i)
strs = gets.chomp.split(" ").map(&:to_i)

i = 0
strs.select!(&:even?)
strs.each do |str|
  while str.even?
    i += 1
    str /= 2
  end
end
puts i
