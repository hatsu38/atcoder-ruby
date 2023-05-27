# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# strs = N.times.map{ gets.chomp.split('') }

# input
# 4 4
# ##.#
# ....
# ##.#
# .#.#
# output
# ###
# ###
# .##

h, w = gets.chomp.split.map(&:to_i)
strs = Array.new(h) { gets.chomp.chars }
strs.delete(Array.new(w, '.')) # 白いマスのみの行を削除

point_idx_ary = []
# 各行で'.'が出現するIndex(列)一覧を取得
strs.each do |str|
  point_idx_ary << str.each_with_index.select { |ary, _idx| ary == '.' }.map(&:last)
end
# 全部の列で'.'が出現している列を取得
del_idx_column = point_idx_ary.flatten.group_by(&:itself).select { |_k, v| v.size == strs.size }.keys

# print strs
strs.each_with_index do |str, _idx|
  str.each_with_index do |st, i|
    next if del_idx_column.include?(i)

    print st
  end
  puts ''
end
