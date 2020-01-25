### 例
# N
# a_1 b_1
# ...
# a_N b_N

# N = gets.to_i
# a, b = N.times.map{gets.split.map(&:to_i)}.transpose

# input
# 11
# output
# Yes
n = gets.to_i

def is_yes?(x)
  if x % 4 == 0 || x % 7 == 0 || x % 11 == 0
    puts 'Yes'
    exit
  end
end

while n >= 4 do
  is_yes?(n)
  n -= 4
end

puts 'No'
