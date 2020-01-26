### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 5 3 6 8
# -10 3 1 5 -100
# 100 6 14
# output
# War
n, m, x, y = gets.chomp.split(' ').map(&:to_i)
x_ary = gets.chomp.split(' ').map(&:to_i)
y_ary = gets.chomp.split(' ').map(&:to_i)
if  x>=y || x_ary.max >= y_ary.min
  puts 'War'
  exit
end
puts [*x_ary.max..y_ary.min].all? { |num| [*x+1..y].include?(num) } ? 'No War' : 'War'

