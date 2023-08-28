# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 9999 10
# 540 7550
# 691 9680
# 700 9790
# 510 7150
# 415 5818
# 551 7712
# 587 8227
# 619 8671
# 588 8228
# 176 2461
# 出力例
# 139815

h, n = gets.chomp.split.map(&:to_i)
strs = Array.new(n) { gets.chomp.split.map(&:to_i) }
print strs

cost_perf = strs.map { |ary| ary[1].to_f / ary[0] }
cost_per_min_index = cost_perf.index(cost_perf.min)
print cost_per_min_index
# コスパの良いIndexの魔力を足していく。モンスターの体力がなくなるまで。
ans = 0
while h >= strs.max
  ans += 1
  h -= strs[cost_per_min_index]
end

puts ans + strs.select { |ary| h <= ary[0] }.min_by { |ary| ary[1] }

# h以下で、最も
