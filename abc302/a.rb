# frozen_string_literal: true

### 例
# 体力が
# A の敵がいます。あなたは、
# 1 回攻撃をすることで敵の体力を
# B 減らすことが出来ます。

# 敵の体力を
# 0 以下にするためには、最小で何回攻撃をする必要があるでしょうか？

# input
# 7 3
# output
# 3

n, m = gets.split.map(&:to_i)

puts((n % m).zero? ? n / m : (n / m) + 1)
