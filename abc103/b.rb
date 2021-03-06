### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# kyoto
# tokyo
# output
# Yes
S = gets.chomp.split('')
T = gets.chomp.split('')

S.each_with_index do |str, idx|
  if S[idx+1..-1]+S[0..idx] == T
    puts 'Yes'
    exit
  end
end
puts 'No'
