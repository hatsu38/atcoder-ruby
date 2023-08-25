=begin
H×W 枚のクッキーがH 行W 列に並んでいます。
上からi 行目・左からj 列目のクッキーの色は英小文字ci,jで表されます。

これから、以下の手続きを行います。

1. 各行に対して次の操作を行う : その行に2 枚以上のクッキーが残っており、それらの色がすべて同じならば、それらに印をつける。

2. 各列に対して次の操作を行う : その列に2 枚以上のクッキーが残っており、それらの色がすべて同じならば、それらに印をつける。

3. 印のついたクッキーがあればそれらをすべて取り除いて 1. に戻り、なければ手続きを終了する。

手続きを終了した時点で残っているクッキーの枚数を求めてください。

制約
2≤H,W≤2000
c i,jは英小文字である

# input
4 3
aaa
aaa
abc
abd

# output
2

# input
2 5
aaaaa
abcde

# output
4

# input
3 3
ooo
ooo
ooo

# output
0

=end

require 'prime'

h, w = gets.chomp.split.map(&:to_i)

cookies = []
i_colors = Array.new(h) { Hash.new(0) }
j_colors = Array.new(w) { Hash.new(0) }
h.times do |i|
  row = gets.chomp.chars
  cookies << row
  row.each_with_index do |color, j|
    i_colors[i][color] += 1
    j_colors[j][color] += 1
  end
end

rows = [*0...h]
cols = [*0...w]
updated = true

while updated && rows.size > 1 && cols.size > 1
  # 行と列をそれぞれチェックして、印を付けられる箇所を除外していく
  excluded_row_chars = []
  puts "rows: #{rows}"
  puts "cols: #{cols}"
  rows, = rows.partition do |i|
    color = i_colors[i]
    next true if color.size > 1

    excluded_row_chars << color.keys.first
    false
  end

  excluded_col_chars = []
  cols, = cols.partition do |j|
    color = j_colors[j]
    next true if color.size > 1

    excluded_col_chars << color.keys.first
    false
  end

  # 相手方から除外した文字を消し込む
  excluded_row_chars.each do |char|
    cols.keep_if do |j|
      color = j_colors[j]
      color[char] -= 1
      color.delete(char) if (color[char]).zero?
      color.size.positive?
    end
  end

  excluded_col_chars.each do |char|
    rows.keep_if do |i|
      color = i_colors[i]
      color[char] -= 1
      color.delete(char) if (color[char]).zero?
      color.size.positive?
    end
  end

  updated = excluded_row_chars.size.positive? || excluded_col_chars.size.positive?
end

puts rows.size * cols.size
