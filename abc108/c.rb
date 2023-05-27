# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 31415 9265
# output
# 27

n, k = gets.chomp.split.map(&:to_i)

if k.even?
  mod_zero = [*1..n].select { |num| (num % k).zero? }
  mod_half_k = [*1..n].select { |num| num % k == k / 2 }
  puts (mod_zero.size**3) + (mod_half_k.size**3)
else
  puts [*1..n].count { |num| (num % k).zero? }**3
end

# 計算量が間に合わない全探索
# ans = 0
# [*1..n].each do |a|
#   [*1..n].each do |b|
#     next if (a+b) % k != 0
#     [*1..n].each do |c|
#       if (a+b) % k == 0 && (b+c) % k == 0 && (c+a) % k == 0
#         ans += 1
#         print [a,b,c]
#       end
#     end
#   end
# end
# puts ans
