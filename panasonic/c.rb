### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 8 10
# output
# 100

a,b,c = gets.chomp.split(' ').map(&:to_i)
print (Math.sqrt(c) - Math.sqrt(a) - Math.sqrt(b) > 0) ? 'Yes' : 'No'
