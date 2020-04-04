### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 12 3
# 4 56 78 901 2 345 67 890 123 45 6 789
# output
# Yes

n, m = gets.chomp.split(' ').map(&:to_i)
arys = gets.chomp.split(' ').map(&:to_i)
sums = arys.inject(:+)
min_base_point = sums / (4*m).to_f

plus_ary = arys.select { |num| num >= min_base_point }.size
puts plus_ary >= m ? 'Yes' : 'No'