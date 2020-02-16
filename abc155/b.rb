### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3
# 28 27 24
# output
# DENIED
n = gets.to_i
strs = gets.chomp.split(' ').map(&:to_i)

even_ary = strs.uniq.select{ |num| num.even? }
if even_ary.all? {|num| num % 3 == 0 || num % 5 == 0 }
  puts 'APPROVED'
else
  puts 'DENIED'
end

