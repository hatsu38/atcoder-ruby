### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 1 1 2
# 10
# 10
# 1 1 5
# 1 1 10
# output
# 10


a_reizo, b_renge, m_quopon = gets.chomp.split(' ').map(&:to_i)
reizoko_ary = gets.chomp.split(' ').map(&:to_i)
renge_ary = gets.chomp.split(' ').map(&:to_i)

min_price = reizoko_ary.min + renge_ary.min
m_quopon.times do
  quopon = gets.chomp.split(' ').map(&:to_i)
  price = reizoko_ary[quopon[0]-1] + renge_ary[quopon[1]-1] - quopon[2]
  min_price = price if min_price > price
end

puts min_price
