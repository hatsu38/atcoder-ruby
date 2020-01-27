### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3 1
# 4 1 5
# output
# 5


n,k = gets.chomp.split(' ').map(&:to_i)
strs = gets.chomp.split(' ').map(&:to_i).sort

if k >= strs.size
  puts 0
  exit
end
strs.slice!(-k, k)
print strs.inject(:+)
