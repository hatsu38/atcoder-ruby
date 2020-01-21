### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 0 5
# output
# 5
d,n = gets.chomp.split(" ").map(&:to_i)
if n < 100
  puts 100 ** 0 * 100
else
  # (例えばd=0で)n=100のとき、100番目に小さい数は100になるが、これは100でちょうど割り切れるので、100はカウントできない。101が100番目に100で割り切れない小さい数となる
  puts 100 ** 0 * (100+1)
end
