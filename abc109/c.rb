# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3 81
# 33 105 57
# 出力例
# 24

_, x = gets.chomp.split.map(&:to_i)
strs = gets.chomp.split.map(&:to_i)
dist = strs.map { |num| (x - num).abs }
g = dist[0]
dist.each do |dis|
  g = g.gcd(dis)
end
print g
