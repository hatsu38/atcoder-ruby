### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# input
# ?6?42???8??2??06243????9??3???7258??5??7???????774????4?1??17???9?5?70???76???
# output
# 153716888

n = gets.to_i
a_ary = gets.chomp.split(' ').map(&:to_i)
taoseru_ary = gets.chomp.split(' ').map(&:to_i)

ans = 0
taoseru_ary.each_with_index do |taoseru, idx|
  # 倒せる数よりAiにいるモンスターの数が多いとき
  if a_ary[idx] >= taoseru
    ans += taoseru
  else # まだ倒せるモンスターががいる時
    # 隣町のモンスターを含めると、倒しきれないとき
    if a_ary[idx+1] + a_ary[idx] >= taoseru
      ans += taoseru
      a_ary[idx+1] = a_ary[idx+1] - (taoseru - a_ary[idx])
    else
      # 隣町のモンスターを倒しきれるとき
      ans += a_ary[idx+1] + a_ary[idx]
      a_ary[idx+1] = 0
    end
  end
end
puts ans
