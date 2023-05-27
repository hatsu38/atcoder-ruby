# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 7
# 1 2 3 4 5 6 7
# output
# YES
gets.chomp.split.map(&:to_i)
strs = gets.chomp.split.map(&:to_i)

# 左から順に見ていく
# Index+1と違う値が2個より大きければ、NO
more_big_cnt = 0
strs.each_with_index do |str, idx|
  more_big_cnt += 1 if str != idx + 1
  if more_big_cnt > 2
    puts 'NO'
    exit
  end
end
puts 'YES'
