# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 39
# RBRBGRBGGBBRRGBBRRRBGGBRBGBRBGBRBBBGBBB
# output
# 1800

gets.to_i
s = gets.chomp.chars

# 文字列sのi,j,k番目が異なる
# 隣あう数字の差が異なる
# ary[1]-ary[0] != ary[2]-ary[1]

ans = 0
# Rの場所固定
s.flat_map.with_index { |e, i| e == 'R' ? i : [] }.each do |r|
  # Gの場所固定
  s.flat_map.with_index { |e, i| e == 'G' ? i : [] }.each do |g|
    # Bの場所固定
    s.flat_map.with_index { |e, i| e == 'B' ? i : [] }.each do |b|
      i, j, k = [r, g, b].sort
      ans += 1 if j - i != k - j
    end
  end
end
puts ans
