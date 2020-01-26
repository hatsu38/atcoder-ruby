### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# abcdefghijklmnopqrstuvwxyz
# ibyhqfrekavclxjstdwgpzmonu
# output
# Yes

s = gets.chomp.split('')
t = gets.chomp.split('')
puts s.group_by(&:itself).map{|k, v| v.size} == t.group_by(&:itself).map{|k, v| v.size} ? 'Yes' : 'No'
