### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# gone
# output
# xxxx
s= gets.chomp.split('')
s.length.times do
  print 'x'
end
