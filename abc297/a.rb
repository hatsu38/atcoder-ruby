### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split.map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 4 500
# 300 900 1300 1700
# output
# 1300

n, m = gets.split.map(&:to_i)
strs = gets.split.map(&:to_i)

strs.each_with_index do |str, idx|
  if idx == n-1
    p -1
    exit
  end
  if strs[idx+1] - str <= m
    p strs[idx+1]
    exit
  end
end
