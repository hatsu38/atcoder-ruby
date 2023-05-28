# frozen_string_literal: true

# ```
# あなたのパソコンのキーボードには、a キー・Shift キー・CapsLock キーの
# 3 種類のキーがあります。また、CapsLock キーにはランプが付いています。 初め、CapsLock キーのランプは OFF であり、パソコンの画面には空文字列が表示されています。

# あなたは、以下の
# 3 種類の操作のうち
# 1 つを選んで実行するということを
# 0 回以上何度でも行うことができます。

# X ミリ秒かけて a キーのみを押す。CapsLock キーのランプが OFF ならば画面の文字列の末尾に a が付け足され、ON ならば A が付け足される。
# Y ミリ秒かけて Shift キーと a キーを同時に押す。CapsLock キーのランプが OFF ならば画面の文字列の末尾に A が付け足され、 ON ならば a が付け足される。
# Z ミリ秒かけて CapsLock キーを押す。CapsLock キーのランプが OFF ならば ON に、ON ならば OFF に切り替わる。
# A と a からなる文字列
# S が与えられます。画面の文字列を
# S に一致させるのに必要な最短の時間は何ミリ秒かを求めてください。

# 制約
# 1≤X,Y,Z≤10
# 9

# X,Y,Z は整数
# 1≤∣S∣≤3×10
# 5

# S は A と a からなる文字列

# 入力例 1
# 1 3 3
# AAaA
# 出力例1
# 9

# 入力例2
# 1 1 100
# aAaAaA
# 出力例2
# 6

# 入力例3
# 1 2 4
# aaAaAaaAAAAaAaaAaAAaaaAAAAA
# 出力例3
# 40
# ```

X, Y, Z = gets.chomp.split.map(&:to_i)
S = gets.chomp.chars

dp = Array.new((S.size + 1)) { Array.new(2, Float::INFINITY) }
dp[0] = [0, Z]

S.size.times.each do |i|
  if S[i] == 'a'
    dp[i + 1][0] = [dp[i][0] + X, dp[i][1] + Z + X].min
    dp[i + 1][1] = [dp[i][0] + Z + Y, dp[i][1] + Y].min
  else
    dp[i + 1][0] = [dp[i][0] + Y, dp[i][1] + Z + Y].min
    dp[i + 1][1] = [dp[i][0] + Z + X, dp[i][1] + X].min
  end
end
puts dp[S.size].min
