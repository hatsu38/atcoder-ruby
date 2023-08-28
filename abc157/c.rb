# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 3 3
# 1 7
# 3 2
# 1 7
# 出力例
# 5

n, m = gets.chomp.split.map(&:to_i)
arys = []
m.times do
  arys << gets.chomp.split.map(&:to_i)
end

arys = arys.uniq
hoge = arys.flatten.each_slice(2).map(&:first)

arys.each do |ary|
  if hoge.count(ary[0]) > 1
    puts(-1)
    exit
  end
end

strs = '~' * n
arys.each do |ary|
  hoge = strs[ary[0] - 1]
  if hoge == '~'
    strs[ary[0] - 1] = ary[1].to_s
    next
  end
  strs[ary[0] - 1] = ary[1].to_s if hoge.to_i > ary[1]
end

strs[0] = '1' if strs[0].to_s == '~' && strs.size > 1

val = strs.tr('~', '0').to_i
if val.to_s.size == n
  puts val.to_i
else
  puts(-1)
end
