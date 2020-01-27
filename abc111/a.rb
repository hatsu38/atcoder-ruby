### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 119
# output
# 991
n = gets.chomp.split('').map(&:to_i)
n.each do |num|
  if num == 1
    print num+8
  elsif num == 9
    print num-8
  else
    print num
  end
end
