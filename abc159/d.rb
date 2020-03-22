### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# 8
# 1 2 1 4 2 1 4 1
# output
# 5
# 7
# 5
# 7
# 7
# 5
# 7
# 5

n = gets.to_i
ary = gets.chomp.split(' ').map(&:to_i)

cnt_hash = ary.each_with_object(Hash.new(0)){|v,o| o[v]+=1}
minas_cnt_hash = {}

ary.uniq.each do |i|
  cnt_hash.reject{|k, _| k == i}.values.each do |val|
    minas_cnt_hash[i] = (val*(val-1))/2
  end
end

puts cnt_hash

ary.each do |i|
  num = cnt_hash[i]-1
  num = 1 if num == 0
  minas_cnt_hash[i] = 0 if minas_cnt_hash.empty?
  puts minas_cnt_hash[i] + (num * (num-1))/2
end
