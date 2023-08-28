# frozen_string_literal: true

### 例
# N
# a_1 b_1
# ...
# a_N b_N

# h,w = gets.chomp.split(' ').map(&:to_i)
# strs = h.times.map{ gets.chomp.split('') }

# 入力例
# 9
# basic
# c
# cpp
# php
# python
# nadesico
# ocaml
# lua
# assembly
# 出力例
# Yes

h = gets.to_i
strs = Array.new(h) { gets.chomp.chars }

if strs.uniq.size != h
  puts 'No'
  exit
end

strs.each_with_index do |str, idx|
  break if idx == h - 1

  if str[-1] != strs[idx + 1][0]
    puts 'No'
    exit
  end
end

puts 'Yes'
