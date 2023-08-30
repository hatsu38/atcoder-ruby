=begin
英小文字のみからなる文字列s,tが与えられます。
あなたは、sの文字を好きな順に並べ替え、文字列s**′を作ります。
また、tの文字を好きな順に並べ替え、文字列t**′を作ります。
このとき、辞書順でs**′<t**′となるようにできるか判定してください。

注釈
長さ N の文字列 a=a1​a2​...aN​ および長さ M の文字列 b=b1​b2​...bM​ について、辞書順で a<b であるとは、次の 2 つの条件のいずれかが成り立つことをいう;

N<M かつ a1​=b1​, a2​=b2​, ..., aN​=bN​ である。
ある i (1≤i≤N,M) が存在して、a1​=b1​, a2​=b2​, ..., ai−1​=bi−1​ かつ ai​<bi​ である。 ただし、文字どうしはアルファベット順で比較される。

例えば、xy < xya であり、atcoder < atlas である。

制約
s, t の長さは 1 以上 100 以下である。
s, t は英小文字のみからなる。

入力入力は以下の形式で標準入力から与えられる。
s
t

出力辞書順で s**′<t**′ となるようにできるならば Yes を、できないならば No を出力せよ。

入力例 1
yx
axy

出力例 1
Yes

例えば、yx を xy と並べ替え、axy を yxa と並べ替えれば、xy < yxa となります。

入力例 2
ratcode
atlas

出力例 2
Yes

例えば、ratcode を acdeort と並べ替え、atlas を tslaa と並べ替えれば、acdeort < tslaa となります。

入力例 3
cd
abc

出力例 3
No

cd, abc をそれぞれどのように並べ替えても、目標を達成できません。

入力例 4
w
ww

出力例 4
Yes

入力例 5
zzz
zzz

出力例 5
No

=end

require 'prime'

s = gets.chomp.chars.sort.join
t = gets.chomp.chars.sort.reverse.join

if s < t
  puts 'Yes'
else
  puts 'No'
end
