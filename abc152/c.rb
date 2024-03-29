# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# problem c
# 入力例
# 8
# 5 7 4 2 6 8 1 3
# 出力例
# 4

N = gets.chomp.to_i
strs = gets.chomp.split.map(&:to_i)
ans = 0
mini = strs[0]
strs.each_with_index do |str, _i|
  # Eachした値が過去の値と比べ最小値なら、答えに+1と最小値を更新
  if str <= mini
    ans += 1
    mini = str
  end
end
puts ans
