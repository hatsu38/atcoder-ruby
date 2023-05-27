# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 3
# 5 6 3 8
# 5 100 8
# output
# 22

gets.to_i
a_ary = gets.chomp.split.map(&:to_i)
taoseru_ary = gets.chomp.split.map(&:to_i)

ans = 0
taoseru_ary.each_with_index do |taoseru, idx|
  # 倒せる数よりAiにいるモンスターの数が多いとき
  if a_ary[idx] >= taoseru
    ans += taoseru
  elsif a_ary[idx + 1] + a_ary[idx] >= taoseru # まだ倒せるモンスターががいる時
    # 隣町のモンスターを含めると、倒しきれないとき
    ans += taoseru
    a_ary[idx + 1] = a_ary[idx + 1] - (taoseru - a_ary[idx])
  else
    # 隣町のモンスターを倒しきれるとき
    ans += a_ary[idx + 1] + a_ary[idx]
    a_ary[idx + 1] = 0
  end
end
puts ans
