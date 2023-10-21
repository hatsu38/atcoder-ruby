=begin
## 問題文
1からNまでの番号が付けられたN個の商品がベルトコンベア上を流れています。
ベルトコンベアには印字機が取り付けられており、商品iは今からTi​[μs]後に印字機の範囲に入り、そのDi​[μs]後に印字機の範囲から出ます。
キーエンスの印字機は、印字機の範囲内にある商品1つに一瞬で印字することができます（特に、商品が印字機の範囲に入る瞬間や範囲から出る瞬間に印字することも可能です）。
ただし、1度印字すると、次に印字するまでに1[μs]のチャージ時間が必要です。
印字機が印字をする商品とタイミングをうまく選んだとき、最大で何個の商品に印字することができますか？

## 制約
1≤N≤2×10**5
1≤Ti​,Di​≤10**18
入力は全て整数

## 入力入力は以下の形式で標準入力から与えられる。
N
T1​ D1​
T2​ D2​
⋮
TN​ DN​

## 出力印字機が印字することのできる商品の数の最大値を出力せよ。

## 入力例 1
5
1 1
1 1
2 1
1 2
1 4

## 出力例 1
4

## 解説
以下、今から t [μs] 後のことを単に時刻 t とよびます。
例えば、次のようにして 4 個の商品に印字することができます。
時刻 1 : 商品 1,2,4,5 が印字機の範囲に入る。商品 4 に印字する。
時刻 2 : 商品 3 が印字機の範囲に入り、商品 1,2 が印字機の範囲から出る。商品 1 に印字する。
時刻 3 : 商品 3,4 が印字機の範囲から出る。商品 3 に印字する。
時刻 4.5 : 商品 5 に印字する。
時刻 5 : 商品 5 が印字機の範囲から出る。
5 個の商品すべてに印字することはできないため、答えは 4 です。

## 入力例 2
2
1 1
1000000000000000000 1000000000000000000

## 出力例 2
2

## 入力例 3
10
4 1
1 2
1 4
3 2
5 1
5 1
4 1
2 1
4 1
2 4

## 出力例 3
6

=end

class Heap
  attr_reader :size

  def initialize
    @heap = []
    @size = 0
  end

  def add(x)
    i = @size
    while i.positive?
      parent_index = (i - 1) / 2
      break if x >= @heap[parent_index]

      @heap[i] = @heap[parent_index]
      i = parent_index
    end
    @heap[i] = x
    @size += 1
  end

  def pop
    return if @size <= 0

    min = @heap[0]
    @size -= 1
    n = @heap[@size]
    i = 0
    b = 1
    while b < @size
      child_index1 = b
      child_index2 = b + 1
      child_index1 = child_index2 if child_index2 < @size && @heap[child_index2] < @heap[child_index1]
      break if @heap[child_index1] >= n

      @heap[i] = @heap[child_index1]
      i = child_index1
      b = (i * 2) + 1
    end
    @heap[i] = n
    min
  end

  def min
    @heap[0]
  end

  def empty?
    @size.zero?
  end
end

n = gets.to_i
arr = []
n.times do
  t, d = gets.split.map(&:to_i)
  arr << [t, d]
end
arr.sort_by! { |t, _d| t }
heap = Heap.new
i = 0
time = 0
cnt = 0
while i < n || !heap.empty?
  time = arr[i][0] if heap.empty?
  while i < n && arr[i][0] == time
    heap.add(arr[i][0] + arr[i][1])
    i += 1
  end
  heap.pop while !heap.empty? && heap.min < time
  unless heap.empty?
    cnt += 1
    heap.pop
  end
  time += 1
end

puts cnt
