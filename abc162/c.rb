# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 200
# output
# 10813692

k = gets.to_i
ans = 0
(1..k).to_a.each do |a|
  (1..k).to_a.each do |b|
    (1..k).to_a.each do |c|
      ans += a.gcd(b.gcd(c))
    end
  end
end
puts ans
