=begin
N カップのアイスクリームがあります。
i カップ目の味は
Fi、美味しさはSi(Siは偶数 ) です。

あなたは、N 個のカップの中から2 つを選んで食べることにしました。
このときの満足度は次のように定義されます。

食べたアイスクリームの美味しさを
s,t ( 但し、s≥t ) とする。
2 つのカップの味が異なるなら、満足度は
s+t である。そうでないなら、満足度は
s+t/2である。
満足度として達成可能な最大値を求めてください。

制約
入力は全て整数
2≤N≤3×10 ** 5
1≤Fi≤N
2≤Si≤10 ** 9
Siは偶数

# 入力例
4
1 4
2 10
2 8
3 6

# 出力例
16

# 入力例
4
4 10
3 2
2 4
4 12

# 出力例
17

=end

require 'prime'

N = gets.chomp.to_i

F_S_INDEX_HASH = {} # key: i, value: {f: f, s: s}
S_F_HASH = {} # key: s, value: f

first = 0
second = 0
third = 0

FLAVER_HASH = {}

RANKING_HASH = {
  'first' => {
    'f' => 0,
    's' => 0
  },
  'second' => {
    'f' => 0,
    's' => 0
  }
}

N.times do |i|
  f, s = gets.chomp.split.map(&:to_i)
  if i.zero?
    RANKING_HASH['first']['f'] = f
    RANKING_HASH['first']['s'] = s
    RANKING_HASH['second']['f'] = f
    RANKING_HASH['second']['s'] = s
  end

  F_S_INDEX_HASH[i] = {
    'f' => f,
    's' => s
  }

  if s > first
    third = second
    second = first
    first = s
    RANKING_HASH['second']['f'] = RANKING_HASH['first']['f']
    RANKING_HASH['second']['s'] = RANKING_HASH['first']['s']
    RANKING_HASH['first']['f'] = f
    RANKING_HASH['first']['s'] = s
  elsif s > second
    third = second
    second = s
    RANKING_HASH['second']['f'] = f
    RANKING_HASH['second']['s'] = s
  end
end

if RANKING_HASH['first']['f'] != RANKING_HASH['second']['f']
  puts RANKING_HASH['first']['s'] + RANKING_HASH['second']['s']
  exit
end
max_satisfaction = RANKING_HASH['first']['s'] + (RANKING_HASH['second']['s'] / 2)

top_another_falver_value = F_S_INDEX_HASH.values.select do |v|
  v['f'] != RANKING_HASH['first']['f'] && v['f'] != RANKING_HASH['second']['f']
end

top_another_falver_value = top_another_falver_value.max_by { |v| v['s'] } || { 's' => 0 }

top_another_falver_value_satisfaction = RANKING_HASH['first']['s'] + top_another_falver_value['s']

puts [max_satisfaction, top_another_falver_value_satisfaction].max
